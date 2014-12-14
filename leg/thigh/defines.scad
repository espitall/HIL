/*
 * define constants of thigh bases
 */
THIGH_LOW_TOP_BASE_OFFSET   = [50, -135, 604];
THIGH_LOW_TOP_BASE_ROTATION = [-11, -3.5, 0];

THIGH_MID_P1_TOP_BASE_OFFSET   = [0, 10, 95];
THIGH_MID_P1_TOP_BASE_ROTATION = [0, 0, 0];

THIGH_MID_P2_TOP_BASE_OFFSET   = [0, 0, 30];


/*
 * define constants of thigh_mid_low
 */
THIGH_MID_LOW_STL = "high thigh";
THIGH_MID_LOW_MID_HIGH_SCREW_NUMBER = 6;
THIGH_MID_LOW_MID_HIGH_SCREW_RADIUS = 70;
THIGH_MID_LOW_MID_HIGH_SCREW_HOLE_HEIGHT = 48;
THIGH_MID_LOW_MID_HIGH_SCREW_HOLE_RADIUS = 2.5;
THIGH_MID_LOW_MID_HIGH_SCREW_NUT_OFFSET = 15;
THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SHIFT = 40;
THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_HEIGHT = 20;
THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_WIDTH = 20;
THIGH_MID_LOW_MID_HIGH_SCREW_NUT_SOLID_OFFSET = 10;
THIGH_MID_LOW_LOW_FIXATION_CUBE = [60, 20, 25];
THIGH_MID_LOW_LOW_FIXATION_ROTATION = [0, 0, 1];
THIGH_MID_LOW_LOW_FIXATION_OFFSET = [[-35, 21.75, -20], [-35, -47.75, -20]];
THIGH_MID_LOW_LOW_FIXATION_BASE_CUBE = [70, 100, 200];
THIGH_MID_LOW_LOW_FIXATION_BASE_ROTATION = [45, 0, 0];
THIGH_MID_LOW_LOW_FIXATION_BASE_OFFSET = [-46, 0, -97];
THIGH_MID_LOW_LOW_FIXATION_BASE_OFFSET_Y1 = [0, -18, 0];
THIGH_MID_LOW_LOW_FIXATION_BASE_OFFSET_Y2 = [0, 29, 0];
THIGH_MID_LOW_INTERNAL_HOLE_BASE_CIRCLE_RADIUS = 100;
THIGH_MID_LOW_INTERNAL_HOLE_BASE_CIRCLE_SCALE = [0.85, 0.70, 1];
THIGH_MID_LOW_INTERNAL_HOLE_BASE_CIRCLE_OFFSET = [-25, -17, 0];
THIGH_MID_LOW_INTERNAL_HOLE_EXTRUDE_HEIGHT = 91.5;
THIGH_MID_LOW_INTERNAL_HOLE_EXTRUDE_SCALE = 0.85;
THIGH_MID_LOW_INTERNAL_HOLE_ROTATION = [0, 180, 0];
THIGH_MID_LOW_INTERNAL_HOLE_OFFSET = [-32, 20, -5];
THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_RADIUS = 2;
THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_LENGTH = 50;
THIGH_MID_LOW_ROLL_MOTOR_SCREW_HOLE_NUT_OFFSET = 8;
THIGH_MID_LOW_ROLL_MOTOR_BASE = [200, 200, 100];
THIGH_MID_LOW_ROLL_MOTOR_AXIS_RADIUS = 8;
THIGH_MID_LOW_ROLL_MOTOR_AXIS_LENGTH = 40;
THIGH_MID_LOW_CUT = 1000;


/*
 * define constants of thigh_mid_internal_p1
 */
THIGH_MID_INTERNAL_P1_GEAR_TEETH_NUMBER = 15;
THIGH_MID_INTERNAL_P1_GEAR_THICKNESS = 11;
THIGH_MID_INTERNAL_P1_GEAR_ROTATION = [0, 0, 180];
THIGH_MID_INTERNAL_P1_GEAR_OFFSET = [0, 0, 1];
THIGH_MID_INTERNAL_P1_CONE_BOT_RADIUS = 60;
THIGH_MID_INTERNAL_P1_CONE_TOP_RADIUS = 40;
THIGH_MID_INTERNAL_P1_CONE_HEIGHT = 35;
THIGH_MID_INTERNAL_P1_TOP_CYLINDER_OFFSET = [0, 0, 20];
THIGH_MID_INTERNAL_P1_TOP_CYLINDER_HEIGHT = 45;
THIGH_MID_INTERNAL_P1_SCREW_HOLE_HEIGHT = 57;
THIGH_MID_INTERNAL_P1_SCREW_HOLE_RADIUS = 2.5;
THIGH_MID_INTERNAL_P1_SCREW_HOLE_LENGTH = 50;
THIGH_MID_INTERNAL_P1_SCREW_HOLE_ROTATION = [0, -90, 0];
THIGH_MID_INTERNAL_P1_NUT_OFFSET = [0, 0, 30];
THIGH_MID_INTERNAL_P1_POTENTIOMETER_OFFSET = [0, 0, -1];
THIGH_MID_INTERNAL_P1_POTENTIOMETER_HEIGHT = 15;


/*
 * define constants of thigh_mid_internal_p2
 */
THIGH_MID_INTERNAL_P2_GEAR_TEETH_NUMBER = 7;
THIGH_MID_INTERNAL_P2_GEAR_THICKNESS = 10;
THIGH_MID_INTERNAL_P2_GEAR_ROTATION = THIGH_MID_INTERNAL_P1_GEAR_ROTATION;
THIGH_MID_INTERNAL_P2_AXIS_HEIGHT = 6;
THIGH_MID_INTERNAL_P2_AXIS_RADIUS = THIGH_MID_LOW_ROLL_MOTOR_AXIS_RADIUS - 1;

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
