m919d_hbase_x = 49;
m919d_hbase_y = 47;
m919d_hbase_z = 1;

m919d_reductor_preaxis_height = 20;
m919d_reductor_preaxis_diam = 12;

m919d_reductor_axis_length = 52;
m919d_reductor_axis_diam = 6.5;

m919d_meplat_length = 14;
m919d_meplat_depth = m919d_reductor_axis_diam - 5.75;



module m919d_bottom_base() {
  hbase_x = 49;
  hbase_y = 47;
  hbase_z = 1;

  hole_x_offset = 4;
  hole_y_offset = hole_x_offset;

  translate([20 - 12 / 2, -47 / 2 + 47/2, 49/2 + 54 - 1]) {
    rotate([0, -90, 0]) {
      children();
    }
  }
}

module m919d_hole_base() {
  hbase_x = 49;
  hbase_y = 47;
  hbase_z = 1;

  hole_x_offset = 4;
  hole_y_offset = hole_x_offset;

  translate([20 - 12 / 2, -47 / 2, 54 - 1]) {
    rotate([0, -90, 0]) {
      for(x = [hole_x_offset, hbase_x - hole_x_offset], y=[hole_y_offset, hbase_y - hole_y_offset]) {
        translate([x, y, hbase_z]) {
          scale([1, 1, -1]) {
            if(y < hbase_y / 2) {
              children();
            }
            else {
              rotate([0, 0, 180]) {
                children();
              }
            }
          }
        }
      }
    }
  }
}

module m919d_base() {
  hbase_x = 49;
  hbase_y = 47;
  hbase_z = 1;

  motor_length = 51;
  motor_diam = 36;
  motor_height = 39; 

  reductor_length = 31;
  reductor_diam = 38;

  reductor_preaxis_length = 35;
  reductor_preaxis_diam = 12;
  reductor_preaxis_height = 20;

  reductor_axis_length = 52;
  reductor_axis_diam = 6.5;

  motor_preaxis_length = 54;
  motor_preaxis_diam = 13;

  motor_axis_length = 55;
  motor_axis_diam = 3;

  elec_x = 58;
  elec_y = 1;
  elec_z = 3;
  elec_y_offset = 14;

  vbase_x = 1;
  vbase_y = 32;
  vbase_z = motor_height - motor_diam / 2;

  hole_diam = 3;
  hole_x_offset = 4;
  hole_y_offset = hole_x_offset;
  hole_z_offset = 1;

  meplat_length = 14;
  meplat_depth = reductor_axis_diam - 5.75;

  difference() {
    union() {
      // base 
      cube([hbase_x, hbase_y, hbase_z]);
      translate([0, hbase_y / 2 - vbase_y/2, 0]) {
        cube([vbase_x, vbase_y, vbase_z]);
      }

      //motor
      translate([0, hbase_y / 2, motor_height - motor_diam / 2]) {
        rotate([0, 90, 0]) {
          cylinder(r = motor_diam / 2, h = motor_length);
        }
      }

      //reductor
      translate([-reductor_length, hbase_y / 2, motor_height - motor_diam / 2]) {
        rotate([0, 90, 0]) {
          cylinder(r = reductor_diam / 2, h = reductor_length);
        }
      }

      //axis
      translate([-reductor_preaxis_length, hbase_y / 2, reductor_preaxis_height - reductor_preaxis_diam / 2 ]) {
        rotate([0, 90, 0]) {
          cylinder(r = reductor_preaxis_diam / 2, h = reductor_preaxis_length);
        }
      }
      difference() {
        translate([-reductor_axis_length, hbase_y / 2, reductor_preaxis_height - reductor_preaxis_diam / 2]) {
          rotate([0, 90, 0]) {
            cylinder(r = reductor_axis_diam / 2, h = reductor_axis_length);
          }
        }

        //meplat
        translate([-reductor_axis_length - 1, 0, 0]) {
          cube([meplat_length + 1, hbase_y, reductor_preaxis_height - reductor_preaxis_diam / 2 - reductor_axis_diam / 2 + meplat_depth]);
        }
      }
      translate([0, hbase_y / 2, motor_height - motor_diam / 2]) {
        rotate([0, 90, 0]) {
          cylinder(r = motor_preaxis_diam / 2, h = motor_preaxis_length);
        }
      }
      translate([0, hbase_y / 2, motor_height - motor_diam / 2]) {
        rotate([0, 90, 0]) {
          cylinder(r = motor_axis_diam / 2, h = motor_axis_length);
        }
      }

      //elec contact
      for(y = [-elec_y_offset, elec_y_offset]) {
        translate([0, hbase_y / 2 - y, motor_height - motor_diam / 2 - elec_z / 2]) {
          cube([elec_x, elec_y, elec_z]);
        }
      }
    }

    //holes
    for(x = [hole_x_offset, hbase_x - hole_x_offset], y=[hole_y_offset, hbase_y - hole_y_offset]) {
      translate([x, y, -hole_z_offset]) {
        cylinder(r = hole_diam / 2, h = hbase_z + hole_z_offset * 2);
      }
    }
  }
}

module m919d(axis_center = true) {
  if(axis_center) {
    translate([20 - 12 / 2, -47 / 2, 54 - 1]) {
      rotate([0, -90, 0]) {
        m919d_base();
      }
    }
  }
  else {
    m919d_base();
  }
}

module m919d_axis() {
  union() {
    difference() {
      cylinder(r = m919d_reductor_axis_diam / 2, h = m919d_reductor_axis_length);

      //meplat
      translate([m919d_reductor_axis_diam / 2 - m919d_meplat_depth, -m919d_hbase_y / 2, -1]) {
        cube([m919d_reductor_preaxis_height - m919d_reductor_preaxis_diam / 2 - m919d_reductor_axis_diam / 2 + m919d_meplat_depth, m919d_hbase_y, m919d_meplat_length + 1]);
      }
    }

    translate([2, 0, 14]) {
      rotate([0, 90, 0]) {
        linear_extrude(height = 3) {
          nut_M3_2D();
        }

        translate([0, 0, -20]) {
          cylinder(r = 3.2 / 2, h = 40);
        }
      }
    }
  }
}
