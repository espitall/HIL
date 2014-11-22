include <calf.scad>
include <../util/m919d.scad>

knee_motor_angle = 20;

module knee_base() {
  calf_top_base() {
    children();
  }
}

module knee_part1() {
  knee_base() {
    rotate([0, knee_motor_angle, 0]) {
      difference() {
        union() {
          translate([0, 25, 0]) {
            rotate([90, 0, 0]) {
              gw_bevel_gear_pair(25, 7, 90, 500, 0, 2);
            }
          }

          translate([0, -4.75, 33]) {
            cylinder(r = 6.5, h = 10);
          }
        }

        translate([14, -28.25, 83]) {
          rotate([0, -90, 0]) {
            m919d();
          }
        }
      }
    }
  }
}

module knee_part2() {
  knee_base() {
    difference() {
      translate([0, 40.5, 0]) {
        rotate([90, 0, 0]) {
          cylinder(r = 14.5, h = 40.5 + 32.5 + 15);
        }
      }

      //screw
      translate([-30, -47.5 + 15 / 2, 0]) {
        rotate([0, 90, 0]) {
          cylinder(r = 4.5 / 2, h = 60);
        }
      }
      translate([-30, 32.5, 0]) {
        rotate([0, 90, 0]) {
          cylinder(r = 4.5 / 2, h = 60);
        }
      }

      translate([-2.5, -47.5 + 15 / 2, 0]) {
        rotate([-90, 0, 0]) {
          rotate([0, 90, 0]) {
            nut_M4_insert(height = 5);
          }
        }
      }

      translate([-2.5, 32.5, 0]) {
        rotate([90, 0, 0]) {
          rotate([0, 90, 0]) {
            nut_M4_insert(height = 5);
          }
        }
      }
    }
  }
}

module knee() {
  knee_part1();
  knee_part2();
}
