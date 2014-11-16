include <involute_gear.scad>

debug_disable_gears = false;

module gw_bevel_gear_pair(gear1_teeth = 41,
	gear2_teeth = 7,
	axis_angle = 90,
	outside_circular_pitch=1000,
  gear_id=0) {
  if(debug_disable_gears == false) {
    bevel_gear_pair(gear1_teeth, gear2_teeth, axis_angle, outside_circular_pitch, gear_id);
  }
}
