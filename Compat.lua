--[[----------------------------------------------------------------------------
	Rematch EllesmereUI Skin: 12.1 compatibility shim

	Patch 12.1 removed the global MouseIsOver() with no Deprecated_12_1_0
	wrapper. Rematch 5.3.1 calls it from fourteen places, all of them runtime
	handlers (menus, loadout hover, the queue glow, drag-and-drop), and the
	first of them to run raises "attempt to call a nil value", which is why
	the journal came up as a blank window in 12.1.

	The 12.0.7 implementation (Blizzard_UIParent/Shared/UIParent.lua) was a
	one-line pass-through to region:IsMouseOver, restored here verbatim. It is
	the same fix the community FixRematch addon ships (unieagle, MIT, folder
	"!RematchCompat"), folded in so this skin is the only extra addon a
	Rematch user needs. The two coexist: whichever loads first defines the
	global and the other sees it already there.

	Timing: every one of Rematch's calls is inside a function, none at file
	scope, so defining this after Rematch has loaded (as our hard dependency
	on it guarantees) is early enough. The guard makes it self-retiring: the
	moment Blizzard or Rematch supplies MouseIsOver again, this file does
	nothing.
------------------------------------------------------------------------------]]

local _, ns = ...

if not MouseIsOver then
	function MouseIsOver(region, topOffset, bottomOffset, leftOffset, rightOffset)
		return region:IsMouseOver(topOffset, bottomOffset, leftOffset, rightOffset)
	end
	-- Read by /rmeuiskin, so a "blank window" report can say in one line
	-- whether the shim was needed and whether it was ours.
	ns.CompatSuppliedMouseIsOver = true
end
