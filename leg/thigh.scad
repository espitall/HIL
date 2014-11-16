include <../util/stl.scad>
include <../util/involute_gear.scad>

module low_thigh() {
  stl("low thigh");
}

module thigh() {
  low_thigh();
}
