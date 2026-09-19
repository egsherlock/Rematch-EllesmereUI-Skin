# Changelog

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
