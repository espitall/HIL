include <defines.scad>

module thigh_high_internal_p1() {
  difference() {
    union() {
      thigh_mid_high_top_base() {
        translate(THIGH_HIGH_INTERNAL_P1_OFFSET) {
          cylinder(r1 = THIGH_MID_HIGH_CONE_BOT_RADIUS, r2 = 0, h = 100);
          translate(-[40, 60, 0] / 2 + [0, 0, 40]) {
          cube([40, 60, 75]);
          }
        }
      }
    }

    //screw holes for thigh_mid_internal_p1
    thigh_mid_low_top_base() {
      for(i = [0 : 4]) {
        translate([0, 0, THIGH_MID_INTERNAL_P1_SCREW_HOLE_HEIGHT]) {
          rotate(THIGH_MID_INTERNAL_P1_SCREW_HOLE_ROTATION + [0, 0, i * 360 / 5]) {
            cylinder(r = THIGH_MID_INTERNAL_P1_SCREW_HOLE_RADIUS, 
                     h = THIGH_MID_INTERNAL_P1_SCREW_HOLE_LENGTH);

             translate(THIGH_HIGH_INTERNAL_P1_THIGH_MID_HEAD_SCREW_HOLE_OFFSET) {
               cylinder(r = THIGH_HIGH_INTERNAL_P1_THIGH_MID_HEAD_SCREW_HOLE_RADIUS, 
                     h = THIGH_MID_INTERNAL_P1_SCREW_HOLE_LENGTH);
             }

          }
        }
      }
    }

    //internal hole for thigh_mid_internal_p1
    thigh_mid_low_top_base() {
      translate(THIGH_MID_INTERNAL_P1_TOP_CYLINDER_OFFSET) {
        cylinder(r = THIGH_MID_INTERNAL_P1_CONE_TOP_RADIUS + 1,
                 h = THIGH_MID_INTERNAL_P1_TOP_CYLINDER_HEIGHT + 1);
      }
    }
  }
}
