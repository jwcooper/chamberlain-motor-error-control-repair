// SHORT VERSION - Replacement motor coupler for LiftMaster 8550W travel module drive
// Disc fastened to the end of the motor shaft with a single center screw.
// 4 slots on top receive the travel module's 4 lugs (3 mm wide, 3 mm tall).
// The screw head sits in a recess below the slot floor so it can't hit the lugs.
// All dimensions in mm. Edit values below, then F6 render and export STL.

// ---- Measured ----
outer_d      = 14.5;  // outside diameter (reduced 0.5 mm)
total_h      = 4;     // overall depth (short version: 2 mm less)
lug_w        = 3;     // width of the travel module's lugs
lug_h        = 3;     // height of the travel module's lugs
lug_count    = 4;

// ---- Screw (default M3 pan/socket head) ----
screw_clear_d = 3.4;  // clearance hole: M2.5=2.9, M3=3.4, M4=4.5, #4=3.2, #6=3.8
head_d        = 6.2;  // screw head diameter + ~0.4 clearance
head_recess_h = 2.3;  // recess depth from top (matches slot depth)

// ---- Fit tuning ----
slot_clear   = 0.7;   // extra slot width (was 0.4; loosened after test fit)
slot_extra_h = 0.3;   // extra slot depth so lugs don't bottom out

// ---- Anti-spin pins ----
// Two through-holes under the solid segments (between slots), 180 deg apart.
// Pins MUST land in a part that ROTATES with the motor shaft, never the
// stationary motor housing. Set pin_r so the pins sit inside the rotating hub.
// Tip: print, screw the disc on, and use the holes as a drill guide.
pin_count = 2;
pin_d     = 2.0;    // pin diameter (2 mm drill bit shank, nail, steel dowel)
pin_fit   = 0.15;   // added to hole; printed holes run small -> snug press fit
pin_r     = 5.0;    // distance from center to pin center  <-- CHECK vs. hub size

$fn = 96;

slot_w = lug_w + slot_clear;
slot_h = lug_h + slot_extra_h - 1;   // short version: slots 1 mm shallower (2.3 mm)

difference() {
    cylinder(d = outer_d, h = total_h);

    // through hole for screw
    translate([0, 0, -1]) cylinder(d = screw_clear_d, h = total_h + 2);

    // recess for screw head, from the top (slot side)
    translate([0, 0, total_h - head_recess_h])
        cylinder(d = head_d, h = head_recess_h + 1);

    // lug slots, cut radially from the top face
    for (i = [0 : lug_count - 1])
        rotate([0, 0, i * 360 / lug_count])
            translate([0, -slot_w/2, total_h - slot_h])
                cube([outer_d, slot_w, slot_h + 1]);

    // anti-spin pin holes, centered under the solid segments (45 deg off slots)
    for (i = [0 : pin_count - 1])
        rotate([0, 0, 45 + i * 360 / pin_count])
            translate([pin_r, 0, -1])
                cylinder(d = pin_d + pin_fit, h = total_h + 2, $fn = 32);
}
