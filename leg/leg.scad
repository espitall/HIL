include <calf.scad>
include <thigh.scad>
include <knee.scad>
include <../util/m919d.scad>

$animate_leg_left_knee_angle = 0;
$animate_leg_right_knee_angle = 0;

module leg_rotate_knee(left = false) {
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

module leg(left = false) {
  union() {
    thigh();
    knee();
    leg_rotate_knee(left) {
      calf();
    }

    //knee motor
    knee_base() {
      rotate([0, knee_motor_angle, 0]) {
        translate([0, -4.5, 30]) {
          m919d(axis_centered = true);
        }
      }
    }

    //thigh motor
    thigh_mid_p1_top_base() {
      translate([-700 * (15 + 7) / 360, 0, 7]) {
        rotate([180, 0, 180]) {
          m919d(axis_centered = true);
        }
      }
    }
  }
}
