include <base_inc.scad>

debug_disable_gears = true;
debug_enable_animation = false;
max_t = 1.0;

module hil_lower(left) {
  mirror(left) {
    leg(left);
   // leg_rotate_knee(left) {
 //     foot();
   // }
  }
}
	
module hil() {
  $animate_leg_left_knee_angle = debug_enable_animation ?
    100 * $t / max_t : 90; 
  $animate_leg_thigh_left_roll_angle = debug_enable_animation ?
    50 * ( 1 - 2 *$t / max_t) : -30; 

  union() {
    hil_lower(false);
   // hil_lower(true);	
  }
}

hil();
