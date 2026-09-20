--[[----------------------------------------------------------------------------
	Rematch EllesmereUI Skin: 12.1 compatibility shims

	Two things in patch 12.1 leave Rematch 5.3.1's journal window blank. Both
	are Rematch's to fix; until it does, this file works around them. Each
	shim is guarded so it steps aside the moment it is no longer needed.

	1. MouseIsOver was removed with no Deprecated_12_1_0 wrapper. Rematch
	   calls it from fourteen places, all runtime handlers (menus, loadout
	   hover, the queue glow, drag-and-drop), and the first to run raises
	   "attempt to call a nil value". The 12.0.7 implementation
	   (Blizzard_UIParent/Shared/UIParent.lua) was a one-line pass-through to
	   region:IsMouseOver, restored here. It is the same one-line fix the
	   community FixRematch addon ships (unieagle, MIT, folder
	   "!RematchCompat"); there is only one way to write it. The two coexist:
	   whichever loads first defines the global and the other sees it there.

	2. Inside instanced content (dungeons, delves, scenarios) the client hands
	   addons the text of a unit tooltip as a SECRET value. Rematch names an
	   NPC by loading a creature link into a scan tooltip and reading the
	   first line back, then calls name:len() on it, which throws "attempt to
	   index local 'name' (a secret string value)". It throws from inside
	   rematch.frame:Configure, which lays out every panel in one pass, so
	   one unreadable name (the loaded target, any team with a target) blanks
	   the whole window. GetNpcName is wrapped in a pcall here; when it fails
	   the wrapper returns Rematch's own "Unknown (npc id N)" wording and
	   caches nothing, so the name resolves normally once the player leaves
	   the instance and the client stops hiding it.

	Timing: every one of Rematch's MouseIsOver calls is inside a function,
	none at file scope, and rematch.targetInfo is built at Rematch's load, so
	running after Rematch has loaded (as our hard dependency guarantees) is
	early enough for both.
------------------------------------------------------------------------------]]

local _, ns = ...

-- 1. MouseIsOver -------------------------------------------------------------

if not MouseIsOver then
	function MouseIsOver(region, topOffset, bottomOffset, leftOffset, rightOffset)
		return region:IsMouseOver(topOffset, bottomOffset, leftOffset, rightOffset)
	end
	-- Read by /rmeuiskin, so a "blank window" report can say in one line
	-- whether the shim was needed and whether it was ours.
	ns.CompatSuppliedMouseIsOver = true
end

-- 2. Secret NPC names --------------------------------------------------------

-- Counted for /rmeuiskin: how many lookups the wrapper had to rescue this
-- session. Non-zero means "you were in an instance and the game hid the
-- names", which is the answer to "why does my target say Unknown".
ns.CompatHiddenNames = 0

do
	local rematch = Rematch
	local targetInfo = rematch and rematch.targetInfo
	local original = targetInfo and targetInfo.GetNpcName

	-- Only on a client that has secret values at all. Without issecretvalue
	-- the failure this guards against cannot happen, and a pcall around a
	-- hot lookup would be pure overhead.
	if type(original) == "function" and issecretvalue then
		local pcall, type, tonumber, format, GetTime = pcall, type, tonumber, format, GetTime
		local L = rematch.localization
		local UNKNOWN = UNKNOWN or "Unknown"

		-- A name the client has just refused stays refused for as long as the
		-- player is in the instance, and Rematch asks for the same few names
		-- on every list refresh. Remember each refusal briefly so a refresh
		-- does not rescan and re-throw for every row; a few seconds is short
		-- enough that leaving the instance is picked up promptly.
		local REFUSED_FOR = 5
		local refusedAt = {}

		local function fallbackName(npcID)
			local id = npcID
			if type(id) == "string" then
				id = tonumber(id:match("target:(%d+)"))
			end
			if type(id) ~= "number" then
				return UNKNOWN
			end
			-- Rematch's own wording for a name it gave up on, so the two
			-- cases read the same to the player.
			local pattern = (L and L["%s (npc id %d)"]) or "%s (npc id %d)"
			local name = format(pattern, UNKNOWN, id)
			local subnames = rematch.targetData and rematch.targetData.subnames
			local sub = subnames and subnames[id]
			if sub then
				name = name .. format(" (%s)", sub)
			end
			return name
		end

		targetInfo.GetNpcName = function(self, npcID, noDisplay)
			local when = refusedAt[npcID]
			if when and GetTime() - when < REFUSED_FOR then
				return fallbackName(npcID)
			end
			local ok, name = pcall(original, self, npcID, noDisplay)
			if ok then
				refusedAt[npcID] = nil
				return name
			end
			refusedAt[npcID] = GetTime()
			ns.CompatHiddenNames = ns.CompatHiddenNames + 1
			return fallbackName(npcID)
		end
		ns.CompatWrappedGetNpcName = true
	end
end
