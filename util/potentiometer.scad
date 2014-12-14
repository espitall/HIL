module pot_axis(axis_radius = 3.5, height = 10, meplat = 1.5) {
  difference() {
    cylinder(r = axis_radius, h = height);

    translate([- 2 * axis_radius, axis_radius - meplat, -1]) {
      cube([axis_radius * 4, axis_radius * 4, height + 2]);
    }
  }
}
