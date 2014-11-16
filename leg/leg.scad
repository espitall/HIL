include <calf.scad>
include <thigh.scad>

module leg() {
  union() {
    calf();
    //thigh();
  }
}

module leg_right() {
  leg();
}

module leg_left() {
  scale([1, -1, 1]) {
    leg();
  }
}
