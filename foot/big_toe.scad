include <../util/stl.scad>
include <toe_bone.scad>

module big_toe() {
  difference() {
    stl("big toe");
    
    //inner part
    toe_bone_base() {
      translate([-7, 0, 20]) {
        cube([85, 20, 14]);
        translate([0, -5, 0]) {
          rotate([-90, 0, 0]) {
            linear_extrude(height = 25) {
              polygon(points=[[0, -50], [60, 0] ,[0, 0]]);
            }
          }
        }
      }

      //holes for sensor
      translate([0, 5, 20]) {
        translate([75 - 5.5, 12.5 / 2, -20]) {
          cylinder(r = 4.5 / 2, h = 35);
          cylinder(r = 9 / 2, h = 7);
        }
        translate([75 - 15.5, 12.5 / 2, -20]) {
          cylinder(r = 4.5 / 2, h = 35);
          cylinder(r = 9 / 2, h = 7);
        }
      }
    }
  }
}
