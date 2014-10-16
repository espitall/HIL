include <ankle.scad>
include <heel.scad>
include <big_toe.scad>
include <little_toe.scad>
include <toe_bone.scad>
include <../util/m919d.scad>
include <../util/weight_sensor.scad>

module foot() {
  union() {
    //ankle(); 
    heel();
    big_toe();
    little_toe();

    //sensor for heel
    heel_base() {
      translate([-25, -10, 14]) {
        rotate([0, 0, 0]) {
          weight_sensor();
        }
      }
    }

    //sensors for toes
    toe_bone_base() {
      translate([0, 5, 20]) {
        weight_sensor();
      }
      translate([0, -5 - 12.7, 15]) {
        weight_sensor();
      }
    }

    ankle_base() {
      translate([45, 25, 35]) {
        rotate([0, 0, 180]) {
          m919d();
        }
      }
    }
  }
}
