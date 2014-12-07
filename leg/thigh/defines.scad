/*
 * define constants of thigh bases
 */
THIGH_LOW_TOP_BASE_OFFSET   = [50, -135, 604];
THIGH_LOW_TOP_BASE_ROTATION = [-11, -3.5, 0];

THIGH_MID_P1_TOP_BASE_OFFSET   = [0, 10, 95];
THIGH_MID_P1_TOP_BASE_ROTATION = [0, 0, 0];

THIGH_MID_P2_TOP_BASE_OFFSET   = [0, 0, 30];

/*
 * define constants of thigh_mid_internal_p1
 */
THIGH_MID_INTERNAL_P1_GEAR_TEETH_NUMBER = 15;

/*
 * define constants of thigh_mid_internal_p2
 */
THIGH_MID_INTERNAL_P2_GEAR_TEETH_NUMBER = 7;
THIGH_MID_INTERNAL_P2_GEAR_THICKNESS = 10;
THIGH_MID_INTERNAL_P2_GEAR_ROTATION = [0, 0, 180];
THIGH_MID_INTERNAL_P2_AXIS_HEIGHT = 6;
THIGH_MID_INTERNAL_P2_AXIS_RADIUS = 7;

/*
 * define constants of the roll motor
 */
THIGH_ROLL_MOTOR_OFFSET = [0, 0, -7];
THIGH_ROLL_MOTOR_ROTATION = [180, 0, -52];


/*
 * Place children into the thigh_low_top base
 */
module thigh_low_top_base(invert = false) {
  if(invert) {
    rotate(-THIGH_LOW_TOP_BASE_ROTATION) {
      translate(-THIGH_LOW_TOP_BASE_OFFSET) {
        children();
      }
    }
  }
  else {
    translate(THIGH_LOW_TOP_BASE_OFFSET) {
      rotate(THIGH_LOW_TOP_BASE_ROTATION) {
        children();
      }
    }
  }
}
/*
 * Place children into the thigh_mid_p1_top base
 */
module thigh_mid_p1_top_base(invert = false) {
  if(invert) {
    thigh_low_top_base(invert = true) {
      rotate(-THIGH_MID_P1_TOP_BASE_ROTATION) {
        translate(-THIGH_MID_P1_TOP_BASE_OFFSET) {
          children();
        }
      }
    }
  }
  else {
    translate(THIGH_MID_P1_TOP_BASE_OFFSET) {
      rotate(THIGH_MID_P1_TOP_BASE_ROTATION) {
        thigh_low_top_base() {
          children();
        }
      }
    }
  }
}
/*
 * Place children into the thigh_mid_p1_top base
 */
module thigh_mid_p2_top_base(invert = false) {
  if(invert) {
    thigh_mid_p1_top_base(invert = true) {
      translate(-THIGH_MID_P2_TOP_BASE_OFFSET) {
        children();
      }
    }
  }
  else {
    translate(THIGH_MID_P2_TOP_BASE_OFFSET) {
      thigh_mid_p1_top_base() {
        children();
      }
    }
  }
}


/*
 * Place children into the roll (Z axis rotation) base
 */
module thigh_roll_motor_base() {
    thigh_mid_p1_top_base() {
      rotate(THIGH_MID_INTERNAL_P2_GEAR_ROTATION) {
        gw_gear_pair_base(gear1_teeth = THIGH_MID_INTERNAL_P1_GEAR_TEETH_NUMBER,
                          gear2_teeth = THIGH_MID_INTERNAL_P2_GEAR_TEETH_NUMBER, 
                          gear_id = 2) {
          rotate(THIGH_ROLL_MOTOR_ROTATION) {
            translate(THIGH_ROLL_MOTOR_OFFSET) {
              children();
            }
          }
        }
      }
    }
}
