include <calf.scad>
include <thigh/thigh.scad>
include <knee.scad>
include <../util/m919d.scad>

$animate_leg_left_knee_angle = 0;
$animate_leg_right_knee_angle = 0;

module leg_rotate_knee(left = false) {
  thigh_yaw(left) {
    calf_top_base() {
      if(left) {
        rotate([0, $animate_leg_left_knee_angle, 0]) {
          calf_top_base_invert() {
            children();
          }
        }
      }
      else {
        rotate([0, $animate_leg_right_knee_angle, 0]) {
          calf_top_base_invert() {
            children();
          }
        }
      }
    }
  }
}

module leg(left = false) {
  union() {
    thigh(left);
    //thigh_yaw(left) {
    //  knee();
    //  //knee motor
    //  knee_base() {
    //    rotate([0, knee_motor_angle, 0]) {
    //      translate([0, -4.5, 30]) {
    // //       m919d(axis_centered = true);
    //      }
    //    }
    //  }

    //  //thigh motor
    //  thigh_yaw_motor_base() {
    //    m919d();
    //  }
    //}
    //leg_rotate_knee(left) {
    //  calf();
    //}
  }
}
