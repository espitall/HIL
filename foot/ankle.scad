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

    //internal holes
    ankle_base() {

    }
  }
}
