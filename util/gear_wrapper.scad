include <involute_gear.scad>

debug_disable_gears = false;

module gw_bevel_gear_pair(gear1_teeth = 41,
	gear2_teeth = 7,
	axis_angle = 90,
	outside_circular_pitch=1000,
  bore_diameter=5,
  gear_id=0,
  force=false) {
  if((debug_disable_gears == false) || (force == true)) {
    bevel_gear_pair(gear1_teeth, gear2_teeth, axis_angle, outside_circular_pitch, bore_diameter, gear_id);
  }
}

module gw_gear_pair(gear1_teeth = 19, gear2_teeth = 12, thickness = 10, gear_id = 0, force = false) {
  circular_pitch = 700;
  offset1 = gear1_teeth * circular_pitch / 360;
  offset2 = gear2_teeth * circular_pitch / 360;
  offset = offset1 + offset2;
  rz = 180 / gear2_teeth * ((gear2_teeth % 2) + 1);

  if((debug_disable_gears == false) || (force == true)) {
    if((gear_id == 0) || (gear_id == 1)) {
      gear(number_of_teeth = gear1_teeth, circular_pitch = circular_pitch, no_bore = true, rim_thickness = thickness, hub_thickness = thickness, gear_thickness = thickness);
    }

    if((gear_id == 0) || (gear_id == 2)) {
      translate([offset, 0, 0]) {
        rotate([0, 0, rz]) {
          gear(number_of_teeth = gear2_teeth, circular_pitch = circular_pitch, no_bore = true, rim_thickness = thickness, hub_thickness = thickness, gear_thickness = thickness);
        }
      }
    }
  }
}
