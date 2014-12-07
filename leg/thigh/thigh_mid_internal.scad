include <defines.scad>

module thigh_mid_internal_p1() {
  difference() {
    union() {
      thigh_mid_p1_top_base() {
        //add gear
        rotate([0, 0, 180]) {
          gw_gear_pair(gear1_teeth = 15, gear2_teeth = 7, gear_id = 1, thickness = 12, force = false);
        }

        //add cone
        difference() {
          translate([0, 0, -1.5]) {
            cylinder(r1 = 60, r2 = 40, h = 35);
          }

          translate([0, 0, -8.5]) {
            cylinder(r1 = 60, r2 = 60, h = 20);
          }
        }

        //generate upper part
        translate([0, 0, 20]) {
          cylinder(r = 40, h = 40);
        }
      }
    }

    //add hole for potentiometer
    thigh_mid_p1_top_base() {
      difference() {
        translate([0, 0, -1]) {
          cylinder(r = 3.25, h = 10);
        }
        translate([0.25, -5, -2]) {
          cube([10, 10, 12]);
        }
      }
    }

    //add screw holes and nuts
    thigh_mid_p1_top_base() {
      for(i = [0 : 4]) {
        translate([0, 0, 50]) {
          rotate([90, 0, i * 360 / 5]) {
            cylinder(r = 2.5, h = 100);
          }
        }
        rotate([0, -90, i * 360 / 5 + 18]) {
          translate([50, 0, 25]) {
            nut_M4_insert();
          }
        }
      }
    }
  }
}

/*
 * create thigh_mid_internal_p2 part. 
 * This part goal is the Z axis rotation of the leg
 */
module thigh_mid_internal_p2() {
  difference() {
    union() {
      thigh_mid_p1_top_base() {
        //add gear
        rotate(THIGH_MID_INTERNAL_P2_GEAR_ROTATION) {
          gw_gear_pair(gear1_teeth = THIGH_MID_INTERNAL_P1_GEAR_TEETH_NUMBER,
                       gear2_teeth = THIGH_MID_INTERNAL_P2_GEAR_TEETH_NUMBER, 
                       gear_id = 2, 
                       thickness = THIGH_MID_INTERNAL_P2_GEAR_THICKNESS);

          //add axis
          gw_gear_pair_base(gear1_teeth = THIGH_MID_INTERNAL_P1_GEAR_TEETH_NUMBER,
                            gear2_teeth = THIGH_MID_INTERNAL_P2_GEAR_TEETH_NUMBER, 
                            gear_id = 2) {
            translate([0, 0, -THIGH_MID_INTERNAL_P2_AXIS_HEIGHT]) {
              cylinder(r = THIGH_MID_INTERNAL_P2_AXIS_RADIUS, 
                       h = THIGH_MID_INTERNAL_P2_AXIS_HEIGHT + THIGH_MID_INTERNAL_P2_GEAR_THICKNESS / 2);
            }
          }
        }
      }
    }

    thigh_roll_motor_base() {
      m919d_axis();
    }
  }
}
