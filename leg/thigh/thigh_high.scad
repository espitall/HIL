include <defines.scad>

module thigh_high() {
  union() {
    difference() {
      stl(THIGH_HIGH_STL);

      //remove low part of the stl file
      thigh_mid_high_top_base() {
        translate([0, 0, -THIGH_HIGH_CUT]) {
          cylinder(r = THIGH_HIGH_CUT, h = THIGH_HIGH_CUT);
        }
      }

      ////roll axis
      //thigh_high_top_base() {
      //  translate([-50, -100, -30]) {
      //    rotate([0, 90, 0]) {
      //      #cylinder(r = 25, h = 100);
      //    }
      //  }
      //}


      //tmp hole
      thigh_mid_high_top_base() {
        translate([0, -150, -5]) {
          cube([THIGH_HIGH_CUT, THIGH_HIGH_CUT, THIGH_HIGH_CUT]);
        }
      }
    }

    //motor
    thigh_high_top_base() {
      rotate([0, 90, -90]) {
        //m919d();
      }
    }
  }
}
