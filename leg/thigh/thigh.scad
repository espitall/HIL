include <thigh_mid.scad>
include <thigh_mid_internal.scad>

/*
 * initialisation of animation angles
 */
$animate_leg_thigh_left_roll_angle = 0;
$animate_leg_thigh_right_roll_angle = 0;

/*
 * Do a rotation of the leg (Z axis)
 */
module thigh_roll(left = false) {
  thigh_mid_high_top_base() {
    if(left) {
      rotate([0, 0, $animate_leg_thigh_left_roll_angle]) {
        thigh_mid_high_top_base(invert = true) {
          children();
        }
      }
    }
    else {
      rotate([0, 0, $animate_leg_thigh_right_roll_angle]) {
        thigh_mid_high_top_base(invert = true) {
          children();
        }
      }
    }
  }
}

/*
 * Include and make an union of all thigh related parts
 */
module thigh(left) {
  union() {
    //thigh_high();
    thigh_mid_internal_p2();

    thigh_roll(left) {
      thigh_mid_internal_p1();
      thigh_mid_low_p1();
      thigh_mid_low_p2();

      thigh_mid_high();
      thigh_low();

      //thigh motor
      thigh_roll_motor_base() {
        m919d();
      }
    }
  }
}
