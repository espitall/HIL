include <defines.scad>
include <../../util/potentiometer.scad>

/*
 * create thigh_mid_internal_p1 part. 
 * This part goal is the Z axis rotation of the leg
 */
module thigh_mid_internal_p1() {
  difference() {
    union() {
      thigh_mid_low_top_base() {
        //add gear
        translate(THIGH_MID_INTERNAL_P1_GEAR_OFFSET) {
          rotate(THIGH_MID_INTERNAL_P1_GEAR_ROTATION) {
            gw_gear_pair(gear1_teeth = THIGH_MID_INTERNAL_P1_GEAR_TEETH_NUMBER,
                         gear2_teeth = THIGH_MID_INTERNAL_P2_GEAR_TEETH_NUMBER, 
                         gear_id = 1, 
                         thickness = THIGH_MID_INTERNAL_P1_GEAR_THICKNESS);
          }
        }

        //add cone
        difference() {
          cylinder(r1 = THIGH_MID_INTERNAL_P1_CONE_BOT_RADIUS, 
                   r2 = THIGH_MID_INTERNAL_P1_CONE_TOP_RADIUS, 
                   h = THIGH_MID_INTERNAL_P1_CONE_HEIGHT);

          translate([0, 0, -1]) {
            cylinder(r = THIGH_MID_INTERNAL_P1_CONE_BOT_RADIUS + 1,
                     h = THIGH_MID_INTERNAL_P1_GEAR_THICKNESS + 1);
          }
        }

        //generate upper part
        translate(THIGH_MID_INTERNAL_P1_TOP_CYLINDER_OFFSET) {
          cylinder(r = THIGH_MID_INTERNAL_P1_CONE_TOP_RADIUS,
                   h = THIGH_MID_INTERNAL_P1_TOP_CYLINDER_HEIGHT);
        }
      }
    }

    //add hole for potentiometer
    thigh_mid_low_top_base() {
      translate(THIGH_MID_INTERNAL_P1_POTENTIOMETER_OFFSET) {
        potentiometer_axis();
      }
    }

    //add screw holes and nuts
    thigh_mid_low_top_base() {
      for(i = [0 : 4]) {
        translate([0, 0, THIGH_MID_INTERNAL_P1_SCREW_HOLE_HEIGHT]) {
          rotate(THIGH_MID_INTERNAL_P1_SCREW_HOLE_ROTATION + [0, 0, i * 360 / 5]) {
            cylinder(r = THIGH_MID_INTERNAL_P1_SCREW_HOLE_RADIUS, 
                     h = THIGH_MID_INTERNAL_P1_SCREW_HOLE_LENGTH);

            translate(THIGH_MID_INTERNAL_P1_NUT_OFFSET) {
              nut_M4_insert();
            }
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
      thigh_mid_low_top_base() {
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
