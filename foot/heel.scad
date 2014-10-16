include <../util/stl.scad>

module heel_base() {
  translate([0, -200, 0]) {
    rotate([0, 0, -5]) {
      children();
    }
  }
}

module heel() {
  difference() {
    union() {
      stl("heel");
    }

    heel_base() {

      //sensor
      translate([-25, -10, 14]) {
        translate([-5, -2.5, 0]) {
          cube([90, 12.7 + 5, 50]);
        }

        //sensor holes
        translate([5.5, 12.5 / 2, -20]) {
          cylinder(r = 4.5 / 2, h = 50);
          cylinder(r = 9 / 2, h = 15);
        }
        translate([15.5, 12.5 / 2, -20]) {
          cylinder(r = 4.5 / 2, h = 50);
          cylinder(r = 9 / 2, h = 15);
        }
      }

      //offset
      translate([-50, -50, 25]) {
        cube([150, 100, 10]);
      }
    }
  }
}
