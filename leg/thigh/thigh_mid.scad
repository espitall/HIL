include <defines.scad>
include <../../util/func.scad>

/*
 * create thigh_mid_high part
 */
module thigh_mid_high() {
  difference() {
      stl(THIGH_MID_HIGH_STL);

      difference() {
        scale([THIGH_MID_HIGH_INTERNAL_SCALE, THIGH_MID_HIGH_INTERNAL_SCALE, 1]) { 
          translate(THIGH_MID_HIGH_INTERNAL_OFFSET) {
            stl(THIGH_MID_HIGH_STL);
          }
        }

        thigh_mid_low_top_base() {
          cylinder(r = THIGH_MID_HIGH_CONE_BOT_RADIUS, h = THIGH_MID_HIGH_CUT);
          cylinder(r = THIGH_MID_HIGH_CUT, h = THIGH_MID_HIGH_INTERNAL_HEIGHT);
        }
      }

    //remove high part of the stl file
    thigh_mid_high_top_base() {
     cylinder(r = THIGH_MID_HIGH_CUT, h = THIGH_MID_HIGH_CUT);
    }

    //remove low part of the stl file
    thigh_mid_low_top_base() {
      translate([0, 0, -THIGH_MID_HIGH_CUT]) {
        cylinder(r = THIGH_MID_HIGH_CUT, h = THIGH_MID_HIGH_CUT);
      }
    }

    //add internal hole
    thigh_mid_low_top_base() {
      cylinder(r1 = THIGH_MID_HIGH_CONE_BOT_RADIUS, 
               r2 = THIGH_MID_HIGH_CONE_TOP_RADIUS, 
               h = THIGH_MID_HIGH_CONE_HEIGHT);

      cylinder(r = THIGH_MID_HIGH_CONE_TOP_RADIUS,
               h = THIGH_MID_HIGH_CONE_HEIGHT * 2);

      translate([0, 0, -1]) {
        cylinder(r = THIGH_MID_HIGH_CONE_BOT_RADIUS,
               h = 2);
      }

      rotate(THIGH_MID_INTERNAL_P2_GEAR_ROTATION) {
        gw_gear_pair_base(gear1_teeth = THIGH_MID_INTERNAL_P1_GEAR_TEETH_NUMBER,
                          gear2_teeth = THIGH_MID_INTERNAL_P2_GEAR_TEETH_NUMBER, 
                          gear_id = 2) {
          translate([0, 0, -1]) {
            cylinder(r = THIGH_MID_HIGH_GEAR_HOLE_RADIUS, h = THIGH_MID_HIGH_GEAR_HOLE_HEIGHT + 1);
          }
        }
      }
    }

    //add screw holes
    thigh_mid_low_top_base() {
      for(i = [0 : (THIGH_MID_LOW_MID_HIGH_SCREW_NUMBER - 1)]) {
        rotate([0, 0, i * 360 / THIGH_MID_LOW_MID_HIGH_SCREW_NUMBER]) {
          translate([THIGH_MID_LOW_MID_HIGH_SCREW_RADIUS, 0, -1]) {
            cylinder(r = THIGH_MID_LOW_MID_HIGH_SCREW_HOLE_RADIUS, 
                     h = THIGH_MID_HIGH_SCREW_HOLE_HEIGHT + 1);
          }

          translate([THIGH_MID_LOW_MID_HIGH_SCREW_RADIUS, 0, THIGH_MID_HIGH_INTERNAL_HEIGHT - 1]) {
            cylinder(r = THIGH_MID_HIGH_HEAD_SCREW_RADIUS, 
                     h = THIGH_MID_HIGH_SCREW_HOLE_HEIGHT + 1);
          
}
        }
      }
    }

    //hole for cables
    thigh_mid_low_top_base() {
      rotate(THIGH_MID_LOW_CABLE_HOLE_ROTATION + THIGH_MID_HIGH_CABLE_HOLE_ROTATION ) {
          translate(THIGH_MID_LOW_CABLE_HOLE_OFFSET + THIGH_MID_HIGH_CABLE_HOLE_OFFSET) {
          cylinder(r = THIGH_MID_LOW_CABLE_HOLE_RADIUS,
                   h = THIGH_MID_LOW_CABLE_HOLE_HEIGHT);
        }
      }
    }
  }
}


/*
 * create thigh_mid_low part. Should not be printed in one part
 */
module thigh_mid_low() {
  union() {
    difference() {
      union() {
        stl(THIGH_MID_LOW_STL);

        //thigh_low fixation
        thigh_low_top_base() {
          for(offset = THIGH_MID_LOW_LOW_FIXATION_OFFSET) {
            translate(offset) {
              rotate(THIGH_MID_LOW_LOW_FIXATION_ROTATION) {
                cube(THIGH_MID_LOW_LOW_FIXATION_CUBE);
              }
            }
          }
        }
      }

      //remove high part of the stl file
      thigh_mid_low_top_base() {
        cylinder(r = THIGH_MID_LOW_CUT, h = THIGH_MID_LOW_CUT);
      }

      //add holes and nuts (for thigh high)
      thigh_mid_low_top_base() {
        for(i = [0 : (THIGH_MID_LOW_MID_HIGH_SCREW_NUMBER - 1)]) {
          rotate([0, 0, i * 360 / THIGH_MID_LOW_MID_HIGH_SCREW_NUMBER]) {
            translate([THIGH_MID_LOW_MID_HIGH_SCREW_RADIUS, 0, -THIGH_MID_LOW_MID_HIGH_SCREW_HOLE_HEIGHT]) {
              cylinder(r = THIGH_MID_LOW_MID_HIGH_SCREW_HOLE_RADIUS, 
                        h = THIGH_MID_LOW_MID_HIGH_SCREW_HOLE_HEIGHT + 1);
            }
            translate([THIGH_MID_LOW_MID_HIGH_SCREW_RADIUS, 0, -THIGH_MID_LOW_MID_HIGH_SCREW_NUT_OFFSET]) {
              nut_M4_insert(shift = THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SHIFT);
            }
          }
        }
      }

      //add internal hole
      thigh_mid_low_top_base() {
        difference() {
          translate(THIGH_MID_LOW_INTERNAL_HOLE_OFFSET) {
            rotate(THIGH_MID_LOW_INTERNAL_HOLE_ROTATION) {
              linear_extrude(height = THIGH_MID_LOW_INTERNAL_HOLE_EXTRUDE_HEIGHT, scale = THIGH_MID_LOW_INTERNAL_HOLE_EXTRUDE_SCALE) {
                translate(THIGH_MID_LOW_INTERNAL_HOLE_BASE_CIRCLE_OFFSET) {
                  scale(THIGH_MID_LOW_INTERNAL_HOLE_BASE_CIRCLE_SCALE) {
                    circle(r = THIGH_MID_LOW_INTERNAL_HOLE_BASE_CIRCLE_RADIUS);
                  }
                }
              }
            }
          }
          
          //motor fixation
          thigh_mid_low_top_base(true) {
            thigh_roll_motor_base() {
              m919d_bottom_base() {
                translate(xy_center(THIGH_MID_LOW_ROLL_MOTOR_BASE)) {
                  scale([1, 1, -1]) {
                    cube(THIGH_MID_LOW_ROLL_MOTOR_BASE);
                  }
                }
              }
            }
          }

          //thigh high
          for(i = [0 : (THIGH_MID_LOW_MID_HIGH_SCREW_NUMBER - 1)]) {
            rotate([0, 0, i * 360 / THIGH_MID_LOW_MID_HIGH_SCREW_NUMBER]) {
              translate([THIGH_MID_LOW_MID_HIGH_SCREW_RADIUS - THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_OFFSET,
                         -THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_WIDTH / 2,
                         -THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_HEIGHT]) {
                cube([THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_OFFSET * 4,
                       THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_WIDTH,
                       THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_HEIGHT * 2]);
              }
            }
          }

          //low thigh
          translate(THIGH_MID_LOW_LOW_FIXATION_BASE_OFFSET + THIGH_MID_LOW_LOW_FIXATION_BASE_OFFSET_Y1) {
            rotate(THIGH_MID_LOW_LOW_FIXATION_BASE_ROTATION) {
              scale([1, -1, 1])
                cube(THIGH_MID_LOW_LOW_FIXATION_BASE_CUBE);
            }
          }
          translate(THIGH_MID_LOW_LOW_FIXATION_BASE_OFFSET + THIGH_MID_LOW_LOW_FIXATION_BASE_OFFSET_Y2) {
            rotate(-THIGH_MID_LOW_LOW_FIXATION_BASE_ROTATION) {
              cube(THIGH_MID_LOW_LOW_FIXATION_BASE_CUBE);
            }
          }
        }
      }

      thigh_roll_motor_base() {
        cylinder(r = THIGH_MID_LOW_ROLL_MOTOR_AXIS_RADIUS, 
                 h = THIGH_MID_LOW_ROLL_MOTOR_AXIS_LENGTH);
      }

      thigh_mid_low_top_base() {
        union() {
          //hole for potentiometer
          translate([0, 0, -20]) {
            cylinder(r = 8 / 2, h = 40);
          }
        }
      }

      //potentiometer attach
      thigh_mid_low_top_base() {
        for(a = [0, 180]) {
          rotate([0, 0, a + 45]) {
            translate([0, 20, -20]) {
              cylinder(r = 4.5 / 2, h = 40);
            }
          }
        }
      }

      //holes for motor
      thigh_roll_motor_base() {
        m919d_hole_base() {
          union() {
            cylinder(r = THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_RADIUS, 
                     h = THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_LENGTH);
            translate([0, 0, THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_NUT_OFFSET]) {
              linear_extrude(height = THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_LENGTH - THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_NUT_OFFSET) {
                nut_M3_2D();
              }
            }
          }
        }
      }
      

      //attach for low thigh
      thigh_low_top_base() {
        for(h = [-20, 15], r = [0, 180]) { 
          translate([h, 0, -10]) {
            rotate([90, 0, r]) {
              cylinder(r = 2.5, h = 100);
            }
          }
          translate([h, -3, -10]) {
            rotate([90, 90, r]) {
              translate([0, 0, 10]) {
                linear_extrude(height = 25) {
                  nut_M4_2D();
                }
              }
            }
          }
        }
      }

      //hole for cables
      thigh_mid_low_top_base() {
        rotate(THIGH_MID_LOW_CABLE_HOLE_ROTATION) {
          translate(THIGH_MID_LOW_CABLE_HOLE_OFFSET) {
            cylinder(r = THIGH_MID_LOW_CABLE_HOLE_RADIUS,
                     h = THIGH_MID_LOW_CABLE_HOLE_HEIGHT);
          }
        }
      }

    }
  }
}


/*
 * create first part of thigh_mid_low
 */
module thigh_mid_low_p1() {
  difference() {
    thigh_mid_low();

    //cut thigh_mid_low
    thigh_mid_low_top_base() {
      translate([0, -THIGH_MID_LOW_CUT / 2, -THIGH_MID_LOW_CUT / 2]) {
        cube([THIGH_MID_LOW_CUT, THIGH_MID_LOW_CUT, THIGH_MID_LOW_CUT]);
      }
    }
  }
}


/*
 * create second part of thigh_mid_low
 */
module thigh_mid_low_p2() {
  difference() {
    thigh_mid_low();

    //cut thigh_mid_low
    thigh_mid_low_top_base() {
      translate([-THIGH_MID_LOW_CUT, -THIGH_MID_LOW_CUT / 2, -THIGH_MID_LOW_CUT / 2]) {
        cube([THIGH_MID_LOW_CUT, THIGH_MID_LOW_CUT, THIGH_MID_LOW_CUT]);
      }
    }
  }
}
