include <calf.scad>
include <../util/m919d.scad>

module knee_base() {
  calf_top_base() {
    children();
  }
}

module knee_part1() {
  knee_base() {
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
