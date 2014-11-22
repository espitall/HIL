include <base_inc.scad>

debug_disable_gears = true;
max_t = 1.0;

module hil_lower(left) {
  mirror(left) {
    leg(left);
    leg_rotate_knee(left) {
      foot();
    }
  }
}

module hil() {
  $animate_leg_left_knee_angle = 100 * $t / max_t + 45;
  //$animate_leg_left_knee_angle = 95;

  union() {
    hil_lower(false);
    hil_lower(true);
  }
}

hil();
