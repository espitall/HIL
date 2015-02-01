include <defines.scad>

module torso_pelvis_pitch_axis() {
  torso_pelvis_top_base() {
    difference() {
      translate(TORSO_PELVIS_PITCH_OFFSET) {
        rotate(TORSO_PELVIS_PITCH_ROTATION) {
          translate([0, 0, TORSO_PELVIS_PITCH_AXIS_OFFSET]) {
            cylinder(r = TORSO_PELVIS_PITCH_AXIS_RADIUS, h = TORSO_PELVIS_PITCH_AXIS_LENGTH);
          }
        }
      }

      translate(TORSO_PELVIS_PITCH_OFFSET + TORSO_PELVIS_PITCH_POT_OFFSET) {
        rotate(TORSO_PELVIS_PITCH_POT_ROTATION) {
          potentiometer_axis();
        }
      }

      translate(TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_OFFSET) {
        translate([0, 0, -TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_HEIGHT/2]) {
          cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_HEIGHT);
        }
      }

      translate(TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_OFFSET) {
        translate([0, 0, -TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_NUT_OFFSET / 2]) {
          nut_M4_insert();
        }
      }
    }
  }
}

module torso_pelvis_right_pitch_axis() {
  difference() {
    torso_pelvis_pitch_axis(); 
  }
}

module torso_pelvis_left_pitch_axis() {
  difference() {
    torso_pelvis_top_base() {
      scale([1, -1, 1]) {
        torso_pelvis_top_base(true) {
          torso_pelvis_pitch_axis();
        }
      }
    }
  }
}

module torso_pelvis_center() {
  thigh_high_top_base() {
    difference() {
      union() {
        //base
        translate([-TORSO_PELVIS_CENTER_BASE_CUBE[0] / 2, -TORSO_PELVIS_CENTER_BASE_CUBE[1], -TORSO_PELVIS_CENTER_BASE_CUBE[2]]) {
          cube(TORSO_PELVIS_CENTER_BASE_CUBE);
        }

        translate(TORSO_PELVIS_PITCH_OFFSET) {
          //first axis holder
          rotate(TORSO_PELVIS_PITCH_ROTATION) {
            cylinder(r = TORSO_PELVIS_PITCH_HOLDER_RADIUS,
                     h = TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH);
          }

          translate([-TORSO_PELVIS_PITCH_HOLDER_RADIUS, -TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH, 0]) {
            cube([2 * TORSO_PELVIS_PITCH_HOLDER_RADIUS, TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH, -TORSO_PELVIS_PITCH_OFFSET[2]]);
          }

          //third axis holder
          translate([0, -TORSO_PELVIS_PITCH_THIRD_HOLDER_OFFSET, 0]) {
            rotate(TORSO_PELVIS_PITCH_ROTATION) {
              cylinder(r = TORSO_PELVIS_PITCH_HOLDER_RADIUS, 
                       h = TORSO_PELVIS_PITCH_THIRD_HOLDER_LENGTH);
            }
          }
          translate([-TORSO_PELVIS_PITCH_HOLDER_RADIUS, TORSO_PELVIS_CENTER_PITCH_AXIS_SECOND_HOLDER_OFFSET - TORSO_PELVIS_CENTER_PITCH_AXIS_SECOND_HOLDER_LENGTH, 0]) {
            cube([2 * TORSO_PELVIS_PITCH_HOLDER_RADIUS, TORSO_PELVIS_PITCH_THIRD_HOLDER_LENGTH, -TORSO_PELVIS_PITCH_OFFSET[2]]);
          }
        }
      }

      //pitch axis hole
      translate(TORSO_PELVIS_PITCH_OFFSET) {
        translate([0, -TORSO_PELVIS_PITCH_AXIS_HOLE_OFFSET, 0]) {
          rotate(TORSO_PELVIS_PITCH_ROTATION) {
            cylinder(r = TORSO_PELVIS_PITCH_AXIS_HOLE_RADIUS,
                     h = TORSO_PELVIS_PITCH_AXIS_HOLE_LENGTH);
          }
        }

        //potentiometer hole
        translate(TORSO_PELVIS_PITCH_POT_OFFSET) {
          rotate(TORSO_PELVIS_PITCH_POT_ROTATION) {
            potentiometer_footprint();
          }
        }
      }

      //place for potentiometer cables
      translate(-TORSO_PELVIS_CENTER_CABLE_HOLE_CUBE / 2) {
        cube(TORSO_PELVIS_CENTER_CABLE_HOLE_CUBE);
      }

      //holes for pitch motor screw
      translate(TORSO_PELVIS_PITCH_MOTOR_OFFSET) {
        rotate(TORSO_PELVIS_PITCH_MOTOR_ROTATION) {
          m919d_hole_base() {
            cylinder(r = TORSO_PELVIS_CENTER_PITCH_MOTOR_HOLE_RADIUS, h = TORSO_PELVIS_CENTER_PITCH_MOTOR_HOLE_HEIGHT);
            translate(TORSO_PELVIS_CENTER_PITCH_MOTOR_NUT_OFFSET) {
              rotate(TORSO_PELVIS_CENTER_PITCH_MOTOR_NUT_ROTATION) {
                nut_M3_insert(shift = TORSO_PELVIS_CENTER_PITCH_MOTOR_NUT_SHIFT);
              }
            }
          }
        }
      }

      //holes for abdomen
      for(xscale = [-1, 1], y = TORSO_PELVIS_CENTER_ABDOMEN_SCREW_Y_OFFSET) {
        scale([xscale, 1, 1]) {
          translate(TORSO_PELVIS_CENTER_ABDOMEN_SCREW_X_OFFSET + [0, y, 0]) {
            translate([0, 0, -TORSO_PELVIS_CENTER_ABDOMEN_SCREW_HOLE_HEIGHT + 1]) {
              cylinder(r = TORSO_PELVIS_CENTER_ABDOMEN_SCREW_HOLE_RADIUS, h = TORSO_PELVIS_CENTER_ABDOMEN_SCREW_HOLE_HEIGHT + 1);
            }

            translate(TORSO_PELVIS_CENTER_ABDOMEN_NUT_OFFSET) {
              rotate(TORSO_PELVIS_CENTER_ABDOMEN_NUT_ROTATION) {
                nut_M4_insert(shift = THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SHIFT);
              }
            }
          }
        }
      }
    }
  }
}


module torso_pelvis_center_right() {
  difference() {
    torso_pelvis_center();

    torso_pelvis_top_base() {
      translate(TORSO_PELVIS_PITCH_OFFSET) {
        for(i = [0:3]) {
          rotate(TORSO_PELVIS_CENTER_SCREW_ANGLE  + [0,i * 360 / 4, 0]) {
            translate(TORSO_PELVIS_CENTER_SCREW_OFFSET) {
              cylinder(r = TORSO_PELVIS_CENTER_SCREW_RADIUS,
                       h = TORSO_PELVIS_CENTER_SCREW_LENGTH);
            }

            translate(TORSO_PELVIS_CENTER_HEAD_SCREW_OFFSET) {
              cylinder(r = TORSO_PELVIS_CENTER_HEAD_SCREW_RADIUS, 
                       h = TORSO_PELVIS_CENTER_SCREW_LENGTH);
            }

          }
        }
      }
    }
  }
}

module torso_pelvis_center_left() {
  torso_pelvis_top_base() {
    scale([1, -1, 1]) {
      difference() {
        torso_pelvis_top_base(true) {
          torso_pelvis_center();
        }

        translate(TORSO_PELVIS_PITCH_OFFSET) {
          for(i = [0:3]) {
            rotate(TORSO_PELVIS_CENTER_SCREW_ANGLE  + [0,i * 360 / 4, 0]) {
              translate(TORSO_PELVIS_CENTER_SCREW_OFFSET) {
                cylinder(r = TORSO_PELVIS_CENTER_SCREW_RADIUS,
                         h = TORSO_PELVIS_CENTER_SCREW_LENGTH);
              }

              translate(TORSO_PELVIS_CENTER_HEAD_SCREW_OFFSET) {
                linear_extrude(height = TORSO_PELVIS_CENTER_NUT_LENGTH) {
                  nut_M4_2D();
                }
              }
            }
          }
        }
      }
    }
  }
}

module torso_pelvis_roll_axis_holder_p1() {
  torso_pelvis_top_base() {
    difference() {
      union() {
        //second holder (pitch)
        translate(TORSO_PELVIS_PITCH_OFFSET) {
          translate([0, -TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH, 0]) {
            rotate(TORSO_PELVIS_PITCH_ROTATION ) {
              cylinder(r = TORSO_PELVIS_PITCH_SECOND_HOLDER_RADIUS, h = TORSO_PELVIS_PITCH_THIRD_HOLDER_OFFSET - TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH - 1);
            }
          }
        }

        translate([-TORSO_PELVIS_PITCH_HOLDER_RADIUS, -TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH - TORSO_PELVIS_PITCH_THIRD_HOLDER_OFFSET + TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH + 1, 2 * TORSO_PELVIS_PITCH_OFFSET[2] - TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_BOTTOM_BASE_CUBE[2]]) {
          cube([2 * TORSO_PELVIS_PITCH_HOLDER_RADIUS, TORSO_PELVIS_PITCH_THIRD_HOLDER_OFFSET - TORSO_PELVIS_PITCH_FIRST_HOLDER_LENGTH - 1, -TORSO_PELVIS_PITCH_OFFSET[2] + TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_BOTTOM_BASE_CUBE[2]]);

          translate([0, -TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_BOTTOM_BASE_CUBE[1] , 0]) {
            cube(TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_BOTTOM_BASE_CUBE);
          }
        }
      }

      //hole for axis screw
      translate(TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_OFFSET) {
        translate([0, 0, -TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_HEIGHT]) {
          cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_HEIGHT);
        }

        translate([0, 0, -TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_HEIGHT - TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_HEAD_SCREW_HOLE_OFFSET]) {
          cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_HEAD_SCREW_HOLE_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_AXIS_SCREW_HOLE_HEIGHT);
        }
      }

      //pitch axis hole
      translate(TORSO_PELVIS_PITCH_OFFSET) {
        translate([0, -TORSO_PELVIS_PITCH_AXIS_HOLE_OFFSET, 0]) {
          rotate(TORSO_PELVIS_PITCH_ROTATION) {
            cylinder(r = TORSO_PELVIS_PITCH_AXIS_HOLE_RADIUS,
                     h = TORSO_PELVIS_PITCH_AXIS_HOLE_LENGTH);
          }
        }
      }

      //roll axis screws
      translate(TORSO_PELVIS_ROLL_OFFSET) {
        rotate(TORSO_PELVIS_ROLL_ROTATION) {
          rotate(TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_ROTATION) {
            translate([0, 0, TORSO_PELVIS_ROLL_AXIS_HOLDER_HEAD_SCREW_OFFSET]) {
              cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_HEAD_SCREW_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_LENGTH);
            }
          }
        }
      }

      //p2 screws
      translate(TORSO_PELVIS_ROLL_OFFSET) {
        rotate(TORSO_PELVIS_ROLL_ROTATION) {
          rotate(TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_ROTATION) {
            for(o = [-TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_P2_SCREW_OFFSET, TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_P2_SCREW_OFFSET]) {
              translate([0, o, 0]) {
                cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_LENGTH);
              }
            }
          }
        }
      }
    }
  }
}

module torso_pelvis_roll_axis_holder_p2() {
  torso_pelvis_top_base() {
    difference() {
      union() {
        //fourth holder (pitch)
        translate(TORSO_PELVIS_PITCH_OFFSET) {
          translate([0, -TORSO_PELVIS_PITCH_FOURTH_HOLDER_OFFSET, 0]) {
            rotate(TORSO_PELVIS_PITCH_ROTATION) {
              cylinder(r = TORSO_PELVIS_PITCH_SECOND_HOLDER_RADIUS, h = TORSO_PELVIS_PITCH_FOURTH_HOLDER_LENGTH);
            }

            rotate([90, -90, 0]) {
              gw_gear_pair(gear1_teeth = TORSO_PELVIS_ROLL_AXIS_HOLDER_P2_GEAR_TEETH_NUMBER, 
                           gear2_teeth = TORSO_PELVIS_PITCH_MOTOR_GEAR_TEETH_NUMBER,
                           thickness = TORSO_PELVIS_ROLL_AXIS_HOLDER_P2_GEAR_THICKNESS,  
                           gear_id = 1, 
                           force = true);
            }
          }
        }

        translate([-TORSO_PELVIS_ROLL_AXIS_HOLDER_P2_BODY_CUBE[0] / 2,-TORSO_PELVIS_PITCH_FOURTH_HOLDER_OFFSET - TORSO_PELVIS_PITCH_FOURTH_HOLDER_LENGTH, -TORSO_PELVIS_ROLL_AXIS_HOLDER_P2_BODY_CUBE[2]]) {
          cube(TORSO_PELVIS_ROLL_AXIS_HOLDER_P2_BODY_CUBE );
        }
      }

      //pitch axis hole
      translate(TORSO_PELVIS_PITCH_OFFSET) {
        translate([0, -TORSO_PELVIS_PITCH_AXIS_HOLE_OFFSET, 0]) {
          rotate(TORSO_PELVIS_PITCH_ROTATION) {
            cylinder(r = TORSO_PELVIS_PITCH_AXIS_HOLE_RADIUS,
                     h = TORSO_PELVIS_PITCH_AXIS_HOLE_LENGTH);
          }
        }
      }

      //roll axis hole
      translate(TORSO_PELVIS_ROLL_OFFSET + [-TORSO_PELVIS_ROLL_AXIS_HOLE_LENGTH / 2, 0, 0]) {
        rotate(TORSO_PELVIS_ROLL_ROTATION) {
          cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLE_RADIUS,
                   h = TORSO_PELVIS_ROLL_AXIS_HOLE_LENGTH );
        }
      }

      //roll axis screws
      translate(TORSO_PELVIS_ROLL_OFFSET) {
        rotate(TORSO_PELVIS_ROLL_ROTATION) {
          rotate(TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_ROTATION) {
            cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_LENGTH);

            translate([0, 0, TORSO_PELVIS_ROLL_AXIS_HOLDER_HEAD_SCREW_OFFSET]) {
              cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_HEAD_SCREW_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_LENGTH);
            }
          }
        }
      }

      //p1 screws
      translate(TORSO_PELVIS_ROLL_OFFSET) {
        rotate(TORSO_PELVIS_ROLL_ROTATION) {
          rotate(TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_ROTATION) {
            for(o = [-TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_P2_SCREW_OFFSET, TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_P2_SCREW_OFFSET]) {
              translate([0, o, 0]) {
                cylinder(r = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_RADIUS, h = TORSO_PELVIS_ROLL_AXIS_HOLDER_SCREW_LENGTH);

                rotate(TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_P2_NUT_ROTATION) {
                  translate([0, 0, TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_P2_NUT_OFFSET]) {
                    nut_M4_insert(shift = TORSO_PELVIS_ROLL_AXIS_HOLDER_P1_P2_NUT_SHIFT);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


module torso_pelvis_right_roll_axis_holder_p1() {
  torso_pelvis_roll_axis_holder_p1();
}

module torso_pelvis_left_roll_axis_holder_p1() {
  torso_pelvis_top_base() {
    scale([1, -1, 1]) {
      torso_pelvis_top_base(true) {
        torso_pelvis_roll_axis_holder_p1();
      }
    }
  }
}

module torso_pelvis_right_roll_axis_holder_p2() {
  torso_pelvis_roll_axis_holder_p2();
}

module torso_pelvis_left_roll_axis_holder_p2() {
  torso_pelvis_top_base() {
    scale([1, -1, 1]) {
      torso_pelvis_top_base(true) {
        torso_pelvis_roll_axis_holder_p2();
      }
    }
  }
}

module torso_pelvis(left) {
  if(left) {
    union() {
      torso_pelvis_center_left();
      torso_pelvis_left_pitch_axis();
      torso_pelvis_left_roll_axis_holder_p1();
      torso_pelvis_left_roll_axis_holder_p2();

      //Pitch axis motor
      thigh_high_top_base() {
        scale([1, -1, 1]) 
        translate(TORSO_PELVIS_PITCH_MOTOR_OFFSET) {
          rotate(TORSO_PELVIS_PITCH_MOTOR_ROTATION) {
            m919d();
          }
        }
      }
      
      ////Roll axis motor
      //thigh_high_top_base() {
      //  translate([70, 136, 14]) {
      //    rotate([90, 90, -90]) {
      //      m919d();
      //    }
      //  }
      //}
    }
  }
  else {
    difference() {
      union() {
        torso_pelvis_center_right();
        torso_pelvis_right_pitch_axis();
        torso_pelvis_right_roll_axis_holder_p1();
        torso_pelvis_right_roll_axis_holder_p2();


        //Pitch axis potentiometer
        thigh_high_top_base() {
          translate(TORSO_PELVIS_PITCH_OFFSET + TORSO_PELVIS_PITCH_POT_OFFSET) {
            rotate(TORSO_PELVIS_PITCH_POT_ROTATION) {
              potentiometer();
            }
          }
        }

        //Pitch axis motor
        thigh_high_top_base() {
          translate(TORSO_PELVIS_PITCH_MOTOR_OFFSET) {
            rotate(TORSO_PELVIS_PITCH_MOTOR_ROTATION) {
              m919d();
            }
          }
        }

        //Roll axis motor
        thigh_high_top_base() {
          translate([70, -134, 14]) {
            rotate([90, 90, -90]) {
              m919d();
            }
          }
        }

      }

      thigh_high_top_base() {
        translate([0, -200, -150]) {
 //         cube([300, 600, 300]);
        }
      }
    }
  }
}
