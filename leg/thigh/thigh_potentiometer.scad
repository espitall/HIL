include <defines.scad>

module thigh_potentiometer() {
  thigh_mid_low_top_base() {
    translate(THIGH_MID_INTERNAL_P1_POTENTIOMETER_OFFSET) {
      difference() {
        //body
        rotate(THIGH_POTENTIOMETER_BODY_ROTATION) {
          translate(xy_center(THIGH_POTENTIOMETER_BODY_CUBE) + [0, 0, -THIGH_POTENTIOMETER_BODY_CUBE[2]]) {
            cube(THIGH_POTENTIOMETER_BODY_CUBE);
          }
        }

        //space for nut
        rotate(THIGH_POTENTIOMETER_BODY_ROTATION) {
          translate(-THIGH_POTENTIOMETER_NUT_CUBE / 2) {
            cube(THIGH_POTENTIOMETER_NUT_CUBE);
          }
        }

        //screw hole and screw nut
        for(a = [0, 180]) {
          rotate([0, 0, a + THIGH_POTENTIOMETER_SCREW_HOLE_ANGLE]) {
            translate([0, THIGH_POTENTIOMETER_SCREW_HOLE_OFFSET, -THIGH_POTENTIOMETER_SCREW_HOLE_LENGTH / 2]) {
              cylinder(r = THIGH_POTENTIOMETER_SCREW_HOLE_RADIUS, h = THIGH_POTENTIOMETER_SCREW_HOLE_LENGTH);

              linear_extrude(height = THIGH_POTENTIOMETER_SCREW_NUT_LENGTH) {
                nut_M3_2D();
              }
            }
          }
        }

        //hole for potentiometer
        translate(THIGH_MID_INTERNAL_P1_POTENTIOMETER_OFFSET) {
          potentiometer();
        }
      }
    }
  }
}
