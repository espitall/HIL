include <../util/stl.scad>
include <../util/involute_gear.scad>
include <calf.scad>


$animate_leg_thigh_left_roll_angle = 0;
$animate_leg_thigh_right_roll_angle = 0;


module thigh_low_bottom_base() {
  calf_top_base() {
    children();
  }
}


module thigh_low_top_base_invert() {
  rotate([11, 3.5, 0]) {
    translate([-50, 135, -604]) {
      children();
    }
  }
}

module thigh_low_top_base() {
  translate([50, -135, 604]) {
    rotate([-11, -3.5, 0]) {
      children();
    }
  }
}

module thigh_mid_p1_top_base_invert() {
  thigh_low_top_base_invert() {
    translate([0, -10, -95]) {
      children();
    }
  }
}

module thigh_mid_p1_top_base() {
  translate([0, 10, 95]) {
    thigh_low_top_base() {
      children();
    }
  }
}

module thigh_mid_p2_top_base_invert() {
  thigh_mid_p1_top_base_invert() {
      translate([0, 0, -30]) {
      children();
    }
  }
}

module thigh_mid_p2_top_base() {
  translate([0, 0, 30]) {
    thigh_mid_p1_top_base() {
      children();
    }
  }
}

module thigh_roll(left = false) {
  thigh_mid_p2_top_base() {
    if(left) {
      rotate([0, 0, $animate_leg_thigh_left_roll_angle]) {
        thigh_mid_p2_top_base_invert() {
          children();
        }
      }
    }
    else {
      rotate([0, 0, $animate_leg_thigh_right_roll_angle]) {
        thigh_mid_p2_top_base_invert() {
          children();
        }
      }
    }
  }
}

module thigh_low() {
  difference() {
    union() {
      difference() {
        stl("low thigh");

        //place for calf high
        thigh_low_bottom_base() {
          translate([-100 + 30, -75, -2]) {
            cube([100, 150, 30]);
          }
          translate([-110, -50, 0]) {
            cube([75, 100, 200]);
          }
          translate([40, -5, -15]) {
            rotate([0, -45, 0]) {
              cube([20, 30, 40]);
            }
          }
        }

        //hole for cables
        thigh_low_bottom_base() {
          translate([15, 51, 0]) {
            rotate([10, 0, 0]) {
              cylinder(r = 5, h = 90);
            }
          }
        }

        //screws for mid thigh
        thigh_low_top_base() {
          for(h = [-20, 15], r = [0, 180]) { 
            translate([h, 0, -10]) {
              rotate([90, 0, r]) {
                cylinder(r = 2.5, h = 100);
              }
            }
            translate([h, 0, -10]) {
              rotate([90, 0, r]) {
                translate([0, 0, 60]) {
                  cylinder(r = 6, h = 20);
                }
              }
            }
          }
        }
        
        //place for motor
        thigh_low_bottom_base() {
          rotate([0, knee_motor_angle, 0]) {
            translate([-100 + 20 - 6, -45, 70]) {
              difference() {
                cube([100, 90, 200]);
                translate([-0, 98, -40]) {
                  rotate([35, 0, 0]) {
                    cube([100, 110, 50]);
                  }
                }

                translate([-0, -98, 20]) {
                  rotate([-35, 0, 0]) {
                    cube([100, 110, 50]);
                  }
                }
              }
            }

            translate([-100 + 20 - 6, -55 / 2 - 5, 0]) {
              cube([100, 58, 200]);
            }

            rotate([0, 90, 0]) {
              for(x = [0, 49 - 4 - 4], y = [0, 47 - 4 - 4]) {
                translate([-87 - x, 15 - y, -100]) {
                  cylinder(r = 3.5 / 2, h = 200);
                }

               translate([-87 - x, 15 - y, 30]) {
                 linear_extrude(height = 100) {
                    nut_M3_2D();
                  }
                }
              }
            }
          }
        }
      }

      //calf fixation
      difference() {
        union() {
          thigh_low_bottom_base() {

            translate([0, 40.5, 0]) {
              rotate([90, 0, 0]) {
                cylinder(r = 25, h = 15);
              }
            }

            translate([0, -32.5, 0]) {
              rotate([90, 0, 0]) {
                cylinder(r = 25, h = 15);
              }
            }

            translate([-25, -47.5, 0]) {
              cube([55, 15, 30]);
            }

            translate([-25, 25.5, 0]) {
              cube([55, 15, 30]);
            }
          }
        }

        thigh_low_bottom_base() {
          translate([0, 50, 0]) {
            rotate([90, 0, 0]) {
              cylinder(r = 15, h = 100);
            }
          }
        }

        //screw
        thigh_low_bottom_base() {
          translate([-30, -47.5 + 15 / 2, 0]) {
            rotate([0, 90, 0]) {
              cylinder(r = 5.5, h = 9);
            }
          }
          translate([-30, -47.5 + 15 / 2, 0]) {
            rotate([0, 90, 0]) {
              cylinder(r = 4.5 / 2, h = 60);
            }
          }

          translate([-30, 32.5, 0]) {
            rotate([0, 90, 0]) {
              cylinder(r = 5.5, h = 9);
            }
          }
          translate([-30, 32.5, 0]) {
            rotate([0, 90, 0]) {
              cylinder(r = 4.5 / 2, h = 60);
            }
          }
        }
      }
    }

    calf_top_base() {
      rotate([0, 130, 0]) {
        calf_top_base_invert() {
          calf_high_stl_sub_part();
        }
      }
    }
  }
}

module thigh_mid_p1_x() {
  union() {
    difference() {
      union() {
        stl("high thigh");
        thigh_low_top_base() {
          translate([-35, 21.75, -20]) {
            rotate([0, 0, 1]) {
              cube([60, 20, 25]);
            }
          }

          translate([-35, -47.75, -20]) {
            rotate([0, 0, 1]) {
              cube([60, 20, 25]);
            }
          }
        }
      }

      //remove high part of the stl file
      thigh_mid_p1_top_base() {
        cylinder(r = 300, h = 500);
      }

      //add holes and nuts (for thigh high)
      thigh_mid_p1_top_base() {
        for(i = [0 : 5]) {
          rotate([0, 0, i * 360 / 6]) {
            translate([70, 0, -48]) {
              cylinder(r = 2.5, h = 50);
            }
            translate([70, 0, -15]) {
              nut_M4_insert(shift = 40);
            }
          }
        }
      }

      //add internal hole
      thigh_mid_p1_top_base() {
        difference() {
          translate([-32, 20, -5]) {
            rotate([0, 180, 0]) {
              linear_extrude(height = 95, scale = 0.85) {
                translate([-25, -17, 0]) {
                  scale([0.85, 0.70, 1]) {
                    circle(r = 100);
                  }
                }
              }
            }
          }
          
          //motor fixation
          translate([-157, -100, -100]) {
            cube([100, 200, 100]);
          }


          //thigh high
          for(i = [0 : 5]) {
            rotate([0, 0, i * 360 / 6]) {
              translate([60, -10, -20]) {
                cube([100, 20, 40]);
              }
            }
          }

          //low thigh
          translate([-46, -56, -200]) {
            rotate([45, 0, 0]) {
              cube([70, 100, 200]);
            }
          }
          translate([-46, 26, -100]) {
            rotate([-45, 0, 0]) {
              cube([70, 100, 100]);
            }
          }
        }
      }

      thigh_mid_p1_top_base() {
        union() {
          //hole for motor axis
          translate([-700 * (15 + 7) / 360, 0, -20]) {
            cylinder(r = 8, h = 40);
          }

          //hole for potentiometer
          translate([0, 0, -20]) {
            cylinder(r = 8 / 2, h = 40);
          }
        }
      }

      //potentiometer attach
      thigh_mid_p1_top_base() {
        for(a = [0, 180]) {
          rotate([0, 0, a + 45]) {
            translate([0, 20, -20]) {
              cylinder(r = 4.5 / 2, h = 40);
            }
          }
        }
      }

      //holes for motor
      thigh_mid_p1_top_base() {
        translate([-700 * (15 + 7) / 360, 4.5, 37]) {
          rotate([0, -90, 0]) {
            for(x = [0, 49 - 4 - 4], y = [0, 47 - 4 - 4]) {
              translate([-87 - x, 15 - y, -100]) {
                cylinder(r = 3.5 / 2, h = 200);
              }

              translate([-87 - x, 15 - y, 30]) {
                linear_extrude(height = 100) {
                  nut_M3_2D();
                }
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
            rotate([90, 0, r]) {
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
      thigh_mid_p1_top_base() {
        rotate([0, 45, -20]) {
          translate([50, 0, -20]) {
            cylinder(r = 10, h = 100);
          }
        }
      }

    }
  }
}

module thigh_mid_p1_1() {
  difference() {
    thigh_mid_p1_x();

    thigh_mid_p1_top_base() {
      translate([0, -200, -500]) {
        cube([500, 400, 1000]);
      }
    }
  }
}

module thigh_mid_p1_2() {
  difference() {
    thigh_mid_p1_x();

    thigh_mid_p1_top_base() {
      translate([-500, -200, -500]) {
        cube([500, 400, 1000]);
      }
    }
  }
}

module thigh_mid_p2() {
  difference() {
    stl("high thigh");

    //remove high part of the stl file
    thigh_mid_p2_top_base() {
      cylinder(r = 300, h = 500);
    }

    //remove low part of the stl file
    thigh_mid_p1_top_base() {
      translate([0, 0, -500]) {
        cylinder(r = 300, h = 500);
      }
    }

    //add internal hole
    union() {
      thigh_mid_p1_top_base() {
        translate([0, 0, -1]) {
          cylinder(r1 = 60, r2 = 40, h = 35);
        }

        translate([-700 * (15 + 7) / 360, 0, -20]) {
          cylinder(r = 20, h = 30.5);
        }
      }
    }

    //add screw hole
    thigh_mid_p1_top_base() {
      for(i = [0 : 5]) {
        rotate([0, 0, i * 360 / 6]) {
          translate([70, 0, -1]) {
            cylinder(r = 2.5, h = 40);
          }
        }
      }
    }

    thigh_mid_p1_top_base() {
      for(i = [0 : 5]) {
        if((i != 1) && (i != 4)) {
        rotate([0, 0, (i + 0.25) * 360 / 6]) {
          translate([63, 0, -1]) {
          rotate([0, 0, 12]) {
            cube([20, 30, 40]);
            }
          }
        }
        }
      }
      for(i = [0 : 5]) {
        if((i == 1) || (i == 4)) {
          rotate([0, 0, (i + 0.35) * 360 / 6]) {
            translate([61, 0, -1]) {
              rotate([0, 0, 10]) {
                cube([15, 30, 40]);
              }
            }
          }
        }
      }
    }

    //hole for cables
    thigh_mid_p1_top_base() {
      rotate([0, 0, -20]) {
        translate([63, 0, -4]) {
          cylinder(r1 = 1, r2 = 10, h = 35);
        }
      }
    }
  }
}


module thigh_high() {
  union() {
    stl("high thigh");
  }
}

module thigh_mid_internal_p1() {
  difference() {
    union() {
      thigh_mid_p1_top_base() {
        //add gear
        rotate([0, 0, 180]) {
          gw_gear_pair(gear1_teeth = 15, gear2_teeth = 7, gear_id = 1, thickness = 12, force = true);
        }

        //add cone
        difference() {
          translate([0, 0, -1.5]) {
            cylinder(r1 = 60, r2 = 40, h = 35);
          }

          translate([0, 0, -8.5]) {
            cylinder(r1 = 60, r2 = 60, h = 20);
          }
        }

        //generate upper part
        translate([0, 0, 20]) {
          cylinder(r = 40, h = 40);
        }
      }
    }

    //add hole for potentiometer
    thigh_mid_p1_top_base() {
      difference() {
        translate([0, 0, -1]) {
          cylinder(r = 3.25, h = 10);
        }
        translate([0.25, -5, -2]) {
          cube([10, 10, 12]);
        }
      }
    }

    //add screw holes and nuts
    thigh_mid_p1_top_base() {
      for(i = [0 : 4]) {
        translate([0, 0, 50]) {
          rotate([90, 0, i * 360 / 5]) {
            cylinder(r = 2.5, h = 100);
          }
        }
        rotate([0, -90, i * 360 / 5 + 18]) {
          translate([50, 0, 25]) {
            nut_M4_insert();
          }
        }
      }
    }
  }
}

module thigh_mid_internal_p2() {
  difference() {
    union() {
      thigh_mid_p1_top_base() {
        rotate([0, 0, 180]) {
          gw_gear_pair(gear1_teeth = 15, gear2_teeth = 7, gear_id = 2, thickness = 10, force = true);
        }

        translate([-700 * (15 + 7) / 360, 0, -6]) {
          cylinder(r = 7, h = 10);
        }
      }
    }
    thigh_mid_p1_top_base() {
      translate([-700 * (15 + 7) / 360, 0, 7]) {
        rotate([180, 0, 180]) {
          m919d(axis_centered = true);
        }
      }
    }
  }
}

module thigh(left) {
  union() {
    //thigh_high();
    thigh_mid_internal_p2();

    thigh_roll(left) {
      thigh_mid_p2();
      thigh_mid_internal_p1();
      !thigh_mid_p1_1();
      thigh_mid_p1_2();
      thigh_low();
    }
  }
}
