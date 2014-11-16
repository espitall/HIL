include <../util/stl.scad>

module ankle_base() {
  translate([0, -200, 0]) {
    rotate([0, 0, -5]) {
      children();
    }
  }
}

module ankle() {
  difference() {
    stl("ankle");

    //inner part
    ankle_base() {
      //heel sensor      
      translate([-25, -10, 14]) {
        translate([0, -4, 0]) {
          cube([55, 20, 15]);
        }
        //sensor holes
        rotate([180,0,0]){
          translate([75 - 5.5, -12.5 / 2, -33]) {
            cylinder(r = 5.5 / 2, h = 50);
            cylinder(r = 12 / 2, h = 15);
          }
          translate([75 - 15.5, -12.5 / 2, -33]) {
            cylinder(r = 5.5 / 2, h = 50);
            cylinder(r = 12 / 2, h = 15);
          }
        }
      }


      //motor
      translate([-70, -3, 56]) {
        rotate([0, 90, 0]) {
          cylinder(r = 40 / 2, h = 131);
        }
      }
      translate([30, 20.5, 35]) {
        rotate([0, 0, 180]) {
          cube([55,47,10]);
        }
      }
    }
  }
}
