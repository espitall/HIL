module weight_sensor() {
  hbase_x = 75;
  hbase_y = 12.7;
  hbase_z = 12.7;

  hole_offset = 1;

  hole_diam = 4;
  hole_x_offset = [-4, 4];

  screw_hole_left_diam = 4;
  screw_hole_right_diam = 5;
  screw_hole_offset = [5.5, 15.5];

  difference() {
    union() {
      //base
      cube([hbase_x, hbase_y, hbase_z]);
    }

    //holes
    for(offset = hole_x_offset) {
      translate([hbase_x / 2 + offset, -hole_offset, hbase_z / 2]) {
        rotate([-90, 0, 0]) {
          cylinder(r = 5, h = hbase_y + 2 * hole_offset);
        }
      }
    }


    //screw holes
    for(offset = screw_hole_offset) {
      translate([offset, hbase_y / 2, -hole_offset]) {
        cylinder(r = screw_hole_left_diam / 2, h = hbase_z + 2 * hole_offset);
      }
    }
    for(offset = screw_hole_offset) {
      translate([hbase_x - offset, hbase_y / 2, -hole_offset]) {
        cylinder(r = screw_hole_right_diam / 2, h = hbase_z + 2 * hole_offset);
      }
    }
  }
}
