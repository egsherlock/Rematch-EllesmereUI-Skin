# Changelog

## 1.1.0

- **Now works with EllesmereUI's standalone modules**, such as "EllesmereUI:
  Standalone Raid & Party Frames", not just the full EllesmereUI suite. Until
  now the skin refused to load unless the full suite was installed. It now
  uses whichever EllesmereUI you run and follows its colours, transparency,
  accent and font exactly as before. If you run the full suite, nothing
  changes.
- A standalone module doesn't include EllesmereUI's window border setting, so
  with one, "Follow EllesmereUI" means no border around the Rematch window.
  Pick a border in this addon's options if you'd like one.
- **The 12.1 blank-window fixes no longer need EllesmereUI.** Without it, this
  addon now loads anyway and keeps Rematch's window from opening blank. The
  skin itself stays off until there is an EllesmereUI to match.
- `/rmeuiskin` now says which EllesmereUI it found, naming the standalone
  module if that's what you run.

## 1.0.1

- **Fixed: the Rematch window opened blank inside dungeons, delves and other
  instanced content**, with an error mentioning a "secret string". Inside
  instances the game no longer lets addons read creature names, and Rematch
  gave up on the whole window the moment it hit one. Now the window opens as
  normal; the only difference is that while you are inside an instance, the
  names of your loaded target and of any team's target show as "Unknown
  (npc id …)". Step outside and they read normally again. Nothing else
  changes, and the open world is unaffected.
- `/rmeuiskin` now also reports how many names the game hid this session, so
  a report from inside an instance explains itself.

## 1.0.0

First release.

- Reskins Rematch to match EllesmereUI, following your own EllesmereUI
  settings: window colour, transparency, accent, font and border are read
  live, so switching profile is picked up without you configuring anything.
  Both the standalone window and the Pet Journal seat inside Collections are
  covered.
- **Fixes the blank Rematch window in patch 12.1.** The game removed a small
  function Rematch relies on; this addon puts it back, the same fix FixRematch
  provides, so you don't need that addon as well. If you have it anyway, the two
  get along.
- In the Pet Journal, Rematch's Pets / Teams / Queue / Options tabs are drawn
  to match the Collections tabs beside them, whether that row is stock
  Blizzard, EllesmereUI's, or atrocityEssentials'.
- Pet levels sit in a small round badge on the corner of the icon, in list
  rows, loadout slots and dialogs. The level 25 filter uses the same badge.
- Team tab icons fill their tab, and list scroll bars sit centred in their
  column with a visible track.
- `/rmeuiskin` reports what ran, which versions are installed and whether the
  12.1 fix was needed, for bug reports.
