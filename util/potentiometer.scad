include <func.scad>

POTENTIOMETER_AXIS_RADIUS = 6 / 2;
POTENTIOMETER_AXIS_LENGTH = 15;

POTENTIOMETER_MEPLAT_Y_OFFSET = 1.2;
POTENTIOMETER_MEPLAT_Z_OFFSET = 3;

POTENTIOMETER_SCREW_RADIUS = 9 / 2;
POTENTIOMETER_SCREW_LENGTH = 6;

POTENTIOMETER_SCREW_BASE_CUBE = [11, 10, 2];

POTENTIOMETER_BODY_X_OFFSET = -1;
POTENTIOMETER_BODY_CUBE = [16, 12.5, 6];

POTENTIOMETER_CLIP_X_OFFSET = 4;
POTENTIOMETER_CLIP_SMALL_CUBE = [1.5, 0.5, 3];
POTENTIOMETER_CLIP_LARGE_CUBE = [1.5, 0.5, 10];

POTENTIOMETER_PIN_Y_OFFSET = 1.27;
POTENTIOMETER_PIN_Z_OFFSET = 2;
POTENTIOMETER_PIN_CUBE_1 = [4, 1.5, 0.5];
POTENTIOMETER_PIN_CUBE_2 = [0.5, 1.5, 1.5];
POTENTIOMETER_PIN_CUBE_3 = [0.5, 0.75, 6];

module pot_axis(axis_radius = 3.5, height = 10, meplat = 1.5) {
  difference() {
    cylinder(r = axis_radius, h = height);

    translate([- 2 * axis_radius, axis_radius - meplat, -1]) {
      cube([axis_radius * 4, axis_radius * 4, height + 2]);
    }
  }
}

module potentiometer() {
  union() {
    difference() {
      //axis
      translate([0, 0, -1]) {
        cylinder(r = POTENTIOMETER_AXIS_RADIUS, h = POTENTIOMETER_AXIS_LENGTH + 1);
      }

      //meplat
      translate([- POTENTIOMETER_AXIS_RADIUS, POTENTIOMETER_MEPLAT_Y_OFFSET, POTENTIOMETER_MEPLAT_Z_OFFSET]) {
        cube([2 * POTENTIOMETER_AXIS_RADIUS, 2 * POTENTIOMETER_AXIS_RADIUS, 2 * POTENTIOMETER_AXIS_LENGTH]);
      }
    }

    //screw
    translate([0, 0, -POTENTIOMETER_SCREW_LENGTH - 1]) {
      cylinder(r = POTENTIOMETER_SCREW_RADIUS, h = POTENTIOMETER_SCREW_LENGTH + 1);
    }

    //screw base
    translate([0, 0, -POTENTIOMETER_SCREW_LENGTH]) {
      translate(-POTENTIOMETER_SCREW_BASE_CUBE / 2) {
        cube(POTENTIOMETER_SCREW_BASE_CUBE);
      }
    }

    //body
    translate([POTENTIOMETER_BODY_X_OFFSET, 0, -POTENTIOMETER_SCREW_LENGTH]) {
      translate(xy_center(POTENTIOMETER_BODY_CUBE) + [0, 0, -POTENTIOMETER_BODY_CUBE[2]]) {
        cube(POTENTIOMETER_BODY_CUBE);
      }
    }

    //clips
    translate([0, 0, -POTENTIOMETER_SCREW_LENGTH - POTENTIOMETER_BODY_CUBE[2]]) {
      assign(yoffcst = POTENTIOMETER_BODY_CUBE[1] / 2 - POTENTIOMETER_CLIP_SMALL_CUBE[1] / 2)
      {
        for(xoff = [-POTENTIOMETER_CLIP_X_OFFSET, 0, POTENTIOMETER_CLIP_X_OFFSET], yoff = [-yoffcst, yoffcst]) {
          translate([xoff, yoff, 0]) {
            if(xoff == 0)
            {
              translate(-POTENTIOMETER_CLIP_LARGE_CUBE / 2) {
                cube(POTENTIOMETER_CLIP_LARGE_CUBE);
              }
            }
            else {
              translate(-POTENTIOMETER_CLIP_SMALL_CUBE / 2) {
                cube(POTENTIOMETER_CLIP_SMALL_CUBE);
              }
            }
          }
        }
      }
    }

    //pins
    translate([-POTENTIOMETER_BODY_CUBE[0] / 2 + POTENTIOMETER_BODY_X_OFFSET, 0, -POTENTIOMETER_SCREW_LENGTH - POTENTIOMETER_BODY_CUBE[2] + POTENTIOMETER_PIN_Z_OFFSET]) {
      for(yoffset = [-3 * POTENTIOMETER_PIN_Y_OFFSET, -POTENTIOMETER_PIN_Y_OFFSET, POTENTIOMETER_PIN_Y_OFFSET, 3 * POTENTIOMETER_PIN_Y_OFFSET]) {
        translate([0, yoffset, 0]) {
          translate(-POTENTIOMETER_PIN_CUBE_1 / 2) {
            cube(POTENTIOMETER_PIN_CUBE_1);
          }
          translate([-POTENTIOMETER_PIN_CUBE_1[0] / 2, 0, POTENTIOMETER_PIN_CUBE_1[2] / 2]) {
            translate([0, -POTENTIOMETER_PIN_CUBE_2[1] / 2, -POTENTIOMETER_PIN_CUBE_2[2]]) {
              cube(POTENTIOMETER_PIN_CUBE_2);
            }
            translate([0, -POTENTIOMETER_PIN_CUBE_3[1] / 2, -POTENTIOMETER_PIN_CUBE_3[2]]) {
              cube(POTENTIOMETER_PIN_CUBE_3);
            }
          }
        }
      }
    }
  }
}
