# Rematch EllesmereUI Skin

Reskins [Rematch](https://www.curseforge.com/wow/addons/rematch) to match [EllesmereUI](https://github.com/EllesmereGaming/EllesmereUI), and fixes the blank Rematch window in patch 12.1 while it's at it.

You need both addons installed. This one contains no part of either, and if you're not running both it quietly does nothing.

The whole idea is that it follows **your** EllesmereUI setup rather than imposing a look of its own. Window colour, transparency, accent, font and border all come from your active profile, read fresh each time. Change something in EllesmereUI and Rematch changes with it. Both of Rematch's homes are covered: its own standalone window, and the Pet Journal seat inside the Collections window.

## The 12.1 blank window

Patch 12.1 removed a small API Rematch relies on, and Rematch's author has not yet shipped an update, so the journal comes up as an empty window. This skin restores that API itself, the same fix the standalone [FixRematch](https://www.curseforge.com/wow/addons/fixrematch) addon provides, so you don't need a second addon for it. If you already have FixRematch installed the two get along fine, and once Rematch or the game supplies the API again the fix steps aside on its own.

## What it takes from EllesmereUI

Nothing is hardcoded, and no profile gets special treatment. Imports like atrocityUI or AES work simply because they write these same values.

- **Window colour and transparency** — your profile's Dark Mode fill, colour and alpha both
- **Accent** (selected tabs, checkmarks, sliders, selection borders) — your EllesmereUI accent colour
- **UI font** — the font your EllesmereUI is set to
- **Window border** — the border texture and size from EllesmereUI's own options, including a size of 0 meaning no border
- **Window style** — whatever style you've set for the Collections window

These get re-read every time something is painted, never cached. Switch profile, reopen Rematch, done.

## Options

**Game Menu > Options > AddOns > Rematch EllesmereUI Skin**

- **Window backdrop** (default: EllesmereUI Dark Mode) — uses your Dark Mode colour and alpha. The other choice, Blizzard window art, uses EllesmereUI's own window texture, which is fully opaque and can't be made see-through.
- **Follow EllesmereUI opacity** (default: on) — uses your Dark Mode alpha. Turn off to set the transparency yourself.
- **Opacity** (default: 90) — your own transparency setting. Ignored while the option above is on.
- **Window edge** (default: thin dark line) — a crisp 1px edge. The alternative, EllesmereUI window frame, matches its windows exactly but brings a soft inner shading with it.
- **Border style** (default: follow EllesmereUI) — whatever border you've set in EllesmereUI's own options. You can also pick one yourself from its border list, including Glow, Shadow and any LibSharedMedia borders.
- **Border size** (default: 2) — thickness, 1 to 4. Ignored while following EllesmereUI.

## What it actually touches

**Rematch's own frames**, all over: the main window and its title bar, toolbar, bottom bar, panel tabs and team tabs; the pets, teams, targets, queue and options panels with their lists, headers, search boxes and filters; the loadout panels and ability buttons; the pet card, notes card and ability tooltips; the dialogs; the menus; and the tooltips. Art is only ever faded, never hidden. Nothing is reparented or has its scripts replaced. Two things are redrawn rather than faded: pet levels sit in a small round badge on the icon's corner, and in journal mode Rematch's own tabs are dressed to match the Collections tabs beside them, whichever addon is drawing that row (stock Blizzard, EllesmereUI, or atrocityEssentials).

**Blizzard's Collections frame**, in one specific way: in journal mode Rematch sits inside Collections, so its chrome is faded while Rematch is open and put back when it closes, so it can't show through a transparent backdrop. The Collections tab row underneath is left alone.

Cost is a one-off pass at login plus hooks. There's no OnUpdate, no polling and no per-frame work.

## If something looks wrong

`/rmeuiskin` tells you what actually ran: which backend is live, the versions installed, whether the 12.1 fix was needed, the colours and border it resolved, and any stage that failed. Each section is isolated, so if a frame moves in a Rematch update you lose that section rather than the whole window.

`/rmeuiskin behind` lists anything still drawing behind the window in journal mode, and `/rmeuiskin tabs` compares the tab rows. Both print what the frames really carry, which is usually the fastest way to tell a bug here apart from a Blizzard or EllesmereUI change.

## Compatibility

Written against Rematch 5.3.1 and EllesmereUI 9.1.8. Works on EllesmereUI 8.6.6 and newer. With the Blizz UI Enhanced module running it registers through EllesmereUI's official skinning API and shows up in its Third-Party Addons list; without it, the same primitives are rebuilt from the public helpers EllesmereUI exports. Either way the look is identical.

## Licence

GPLv3. The skinning facade and most of the helpers come from [MountsJournal EllesmereUI Skin](https://github.com/egsherlock/MountsJournal-EllesmereUI-Skin), the same author's earlier skin. The 12.1 compatibility fix is the one shipped by [FixRematch](https://www.curseforge.com/wow/addons/fixrematch) (unieagle, MIT), folded in with thanks. The old [Rematch ElvUI Skin](https://github.com/nihilistzsche/RematchElvUISkin) by Gello and nihilistzsche was the checklist of what a Rematch skin has to reach. Thanks to Gello for Rematch and to EllesmereGaming for EllesmereUI.

Unofficial, and not affiliated with any of those projects. Source and issues: [GitHub](https://github.com/egsherlock/Rematch-EllesmereUI-Skin).
