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
    knee_part1();
    leg_rotate_knee(left) {
      calf();
    }

    //knee motor
    knee_base() {
      translate([14, -28.25, 83]) {
        rotate([0, -90, 0]) {
          m919d();
        }
      }
    }
  }
}
