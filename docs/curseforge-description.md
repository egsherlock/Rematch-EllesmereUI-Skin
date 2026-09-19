# Rematch EllesmereUI Skin

Makes [Rematch](https://www.curseforge.com/wow/addons/rematch) look like the rest of your [EllesmereUI](https://github.com/EllesmereGaming/EllesmereUI) setup. It also fixes the blank Rematch window in patch 12.1, so you don't need a separate addon for that.

You need both Rematch and EllesmereUI installed. This addon contains no part of either, and if you're not running both it quietly does nothing.

## It follows your settings

There is nothing to configure. The skin reads your EllesmereUI profile and matches it: window colour, transparency, accent colour, font and border. Change any of those in EllesmereUI and Rematch changes with it, including when you switch profiles. Popular imports like atrocityUI or AES work out of the box for the same reason.

Both of Rematch's homes are covered: the standalone window, and the Pet Journal tab inside the Collections window, where Rematch's own tabs are drawn to match the Collections tabs beside them.

## The 12.1 blank window

Patch 12.1 removed a small function Rematch relies on, and until Rematch is updated its window opens empty. This skin puts that function back, the same fix the standalone [FixRematch](https://www.curseforge.com/wow/addons/fixrematch) addon provides, so you don't need both. If you already have FixRematch installed, the two get along fine. Once Rematch or the game supplies the function again, the fix switches itself off.

## What you'll notice

- The whole Rematch window in your EllesmereUI colours and transparency: title bar, tabs, panels, lists, search boxes, buttons, cards, menus and tooltips.
- Pet levels shown in a small round badge on the corner of each pet's icon, in lists, loadout slots and dialogs.
- Clean, centred scroll bars and flat buttons with the EllesmereUI border.
- In the Pet Journal, Rematch sits flush with the Collections window and its tabs line up with the Mounts, Toy Box and other tabs next to them.

Rematch itself is untouched. The skin only changes how things look, never what they do.

## Options

**Game Menu > Options > AddOns > Rematch EllesmereUI Skin**

Most people will never need these. The defaults follow EllesmereUI.

- **Window backdrop** — your EllesmereUI Dark Mode colour (default), or EllesmereUI's Blizzard-style window art. The window art is solid and can't be made see-through.
- **Follow EllesmereUI opacity** — on by default. Turn it off to set the window's transparency yourself with the **Opacity** slider.
- **Window edge** — a crisp thin dark line (default), or the same frame EllesmereUI draws around its own windows.
- **Border style** and **Border size** — follow EllesmereUI's border settings (default), or pick one yourself from the same list EllesmereUI offers, including Glow and Shadow.

## If something looks wrong

Type `/rmeuiskin` in chat. It prints what the skin did, which versions of Rematch and EllesmereUI you have, and whether the 12.1 fix was needed. If you report a problem, please paste that output along with a screenshot.

The skin is built in sections, so if a future Rematch update moves something, only that one piece loses its skin rather than the whole window.

## Compatibility

Written for Rematch 5.3.1 and EllesmereUI 9.1.8. Works on EllesmereUI 8.6.6 and newer. With EllesmereUI's Blizzard Skin module running it appears in EllesmereUI's own Third-Party Addons list; without it, it works the same way on its own.

## Credits and licence

GPLv3. Built on the same foundation as the author's [MountsJournal EllesmereUI Skin](https://www.curseforge.com/projects/1633540). The 12.1 fix is the one shipped by [FixRematch](https://www.curseforge.com/wow/addons/fixrematch) by unieagle (MIT), included with thanks. Thanks also to Gello for Rematch, to EllesmereGaming for EllesmereUI, and to Gello and nihilistzsche, whose old Rematch ElvUI Skin showed what a Rematch skin needs to cover.

Unofficial, and not affiliated with any of those projects. Source and issues: [GitHub](https://github.com/egsherlock/Rematch-EllesmereUI-Skin).
