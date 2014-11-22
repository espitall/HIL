include <../util/stl.scad>
include <../util/involute_gear.scad>
include <calf.scad>

module thigh_low_bottom_base() {
  calf_top_base() {
    children();
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
        }

        //place for motor
        thigh_low_bottom_base() {
          rotate([0, knee_motor_angle, 0]) {
            translate([-100 + 20 - 6, -55 / 2 - 4.5, 0]) {
              cube([100, 55, 200]);
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

module thigh() {
  thigh_low();
}
