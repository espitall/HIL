include <thigh_high.scad>
include <thigh_high_internal.scad>
include <thigh_mid.scad>
include <thigh_mid_internal.scad>
include <thigh_potentiometer.scad>

/*
 * initialisation of animation angles
 */
$animate_leg_thigh_left_yaw_angle = 0;
$animate_leg_thigh_right_yaw_angle = 0;

/*
 * Do a rotation of the leg (Z axis)
 */
module thigh_yaw(left = false) {
  thigh_mid_high_top_base() {
    if(left) {
      rotate([0, 0, $animate_leg_thigh_left_yaw_angle]) {
        thigh_mid_high_top_base(invert = true) {
          children();
        }
      }
    }
    else {
      rotate([0, 0, $animate_leg_thigh_right_yaw_angle]) {
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
    thigh_high_internal_p1();
    thigh_mid_internal_p1();

    thigh_yaw(left) {
      thigh_mid_internal_p2();
      thigh_mid_low_p1();
      thigh_mid_low_p2();

      thigh_mid_high();
    //  thigh_low();

    //  //thigh motor
    //  thigh_yaw_motor_base() {
    //    m919d();
    //  }

    //  //thigh potentiometer
    //  thigh_potentiometer();
    //  thigh_mid_low_top_base() {
    //    translate(THIGH_MID_INTERNAL_P1_POTENTIOMETER_OFFSET) {
    //      potentiometer();
    //    }
    //  }
    }
  }
}
