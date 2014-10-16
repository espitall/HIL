include <../util/stl.scad>
include <toe_bone.scad>

module little_toe() {
  difference() {
    stl("little toe");

    //inner part
    toe_bone_base() {
      translate([-7, -20, 15]) {
        cube([80, 25, 14]);
        translate([0, 0, 0]) {
          rotate([-90, 0, 0]) {
            linear_extrude(height = 25) {
              polygon(points=[[0, -40], [60, 0] ,[0, 0]]);
            }
          }
        }
      }
    }
  }
}
