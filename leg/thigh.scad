include <../util/stl.scad>
include <../util/involute_gear.scad>
include <calf.scad>

module thigh_low_bottom_base() {
  calf_top_base() {
    children();
  }
}

module thigh_low() {
  union() {
    difference() {
      stl("low thigh");

      //place for calf high
      thigh_low_bottom_base() {
        translate([-100 + 30, -75, -2]) {
          cube([100, 150, 30]);
        }

        translate([-130, -75, 10]) {
          rotate([0, 10, 0]) {
            cube([100, 150, 100]);
          }
        }

        //place for DCmotor
        translate([-30, -32.5, -20]) {
          cube([60, 58, 200]);
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
    }
  }
}

module thigh() {
  thigh_low();
}
