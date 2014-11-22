include <../util/stl.scad>
include <../util/involute_gear.scad>
include <calf.scad>

module thigh_low_bottom_base() {
  calf_top_base() {
    children();
  }
}

module thigh_low_top_base() {
  translate([50, -135, 604]) {
    rotate([-11, -3.5, 0]) {
      children();
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
              cube([100, 90, 200]);
            }

            translate([-100 + 20 - 6, -55 / 2 - 5, 0]) {
              cube([100, 55, 200]);
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

module thigh_high() {
  union() {
    stl("high thigh");
  }
}

module thigh_mid() {
  union() {
    //stl("high thigh");

    //attach fo low thigh
    difference() {
      union() {
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
    }
  }
}

module thigh() {
  union() {
    //thigh_low();
    thigh_mid();
    thigh_high();
  }
}
