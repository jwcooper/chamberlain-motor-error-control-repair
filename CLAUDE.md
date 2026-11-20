# Project context

3D-printable replacement motor coupler for a LiftMaster 8550W-267 garage door opener
(FCC ID HBW1D8169-1, part number 001D8363), fixing diagnostic error 1-5.

## Background
- Symptom: opener moved the door a few inches, then stopped and reversed; code 1-5
  (1 flash on the up arrow, 5 on the down). Door moved freely by hand; spring and tracks fine.
- Cause: the white plastic gear on the motor (which drives the travel module sensor)
  had its teeth stripped. The travel module itself was fine.
- LiftMaster doesn't sell that gear separately; the official fix is the motor + travel
  module kit 041-0236-000 (~$300), so a printed replacement was designed instead.

## Design (OpenSCAD, parametric)
- `motor_coupler_short.scad`: 4 mm tall (the 6 mm version was dropped).
  Printed file: `motor_coupler_short_pins.stl` / `..._PETG_MK3S_8m.gcode` (Prusa MK3S).
- Outer diameter 14.5 mm; 4 radial slots 3.7 mm wide (travel module lugs are 3 mm wide,
  3 mm tall); `slot_clear = 0.7` after a test fit.
- Fastened with one center M3 screw into the motor; head sits in a 6.2 mm recess
  level with the slot floor.
- The screw alone let it spin loose, so two 2 mm pin holes were added, 180 deg apart,
  at 5 mm radius, under the solid segments. Pins are about 8 mm, set ~4 mm into the
  rotating hub, epoxied in.
- Printed in PETG/nylon, 100% infill, slot side up. Current fit confirmed good.

## Status / next steps
- Epoxy curing on the installed part.
- README.md, index.html (GitHub Pages), and LICENSE (CC BY 4.0) done. Photos in images/
  have all EXIF/GPS stripped; strip metadata from any new photos before adding them.
- After install: reset travel limits and run the safety reverse test (2x4 under the door).
