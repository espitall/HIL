include <../util/stl.scad>
include <../util/nut.scad>
include <../util/gear_wrapper.scad>

module calf_top_base_invert() {
  rotate([11, -2, 0]) {
    translate([-25, 160, -488.5]) {
      children();
    }
  }
}

module calf_top_base() {
  translate([25, -160, 488.5]) {
    rotate([-11, 2, 0]) {
      children();
    }
  }
}

module calf_high_bottom_base() {
  translate([-20, -12, -100]) {
    calf_top_base() {
      children();
    }
  }
}

module calf_mid_bottom_base() {
  translate([-26, -32, -230]) {
    calf_top_base() {
      children();
    }
  }
}

module calf_high_stl_sub_part() {
  difference() {
    stl("calf");

    //place for top fixation
    calf_top_base() {
      translate([-100 + 30, -75, -28]) {
        cube([100, 150, 30]);
      }
    }

    //only high part
    calf_high_bottom_base() {
      translate([-200, -200, -500]) {
        cube([400, 400, 500]);
      }
    }
  }
}

module calf_high() {
  union() {
    difference() {
      calf_high_stl_sub_part();

      //internal hole
      calf_high_bottom_base() {
        translate([-15, -11, -5]) {
          cylinder(r = 15, h = 100);
        }
      }

      calf_high_bottom_base() {
        //aligment hole
        translate([0, 0, -0.1]) {
          cylinder(r1 = 50, r2 = 2, h = 60);
        }
      }

      //screw holes
      calf_high_bottom_base() {
        translate([0, 0, 20]) {
          for(rz = [0, 90, 180, 270]) {
            rotate([90, 0, rz]) {
              translate([0, 0, 20]) {
                cylinder(r = 2.5, h = 100);
              }

              translate([0, 0, 57]) {
                cylinder(r = 6, h = 40);
              }
            }
          }
        }
      }
    }


    //top fixation
    calf_top_base() {
      difference() {
        union() {
          translate([0, 25, 0]) {
            rotate([90, 0, 0]) {
              cylinder(r = 25, h = 15);
            }
          }

          translate([0, -17, 0]) {
            rotate([90, 0, 0]) {
              cylinder(r = 25, h = 15);
            }
          }

          translate([-25, 10, -30]) {
            cube([55, 15, 30]);
          }

          translate([-25, -32, -30]) {
            cube([55, 15, 30]);
          }

          translate([0, 25, 0]) {
            rotate([90, 0, 0]) {
              gw_bevel_gear_pair(25, 7, 90, 500, 0, 1);
            }
          }

        }

        translate([0, 50, 0]) {
          rotate([90, 0, 0]) {
            cylinder(r = 15, h = 100);
          }
        }
      }
    }
  }
}


module calf_mid() {
  difference() {
    union() {
      difference() {
        stl("calf");

        //remove high part
        calf_high_bottom_base() {
          translate([-200, -200, 0]) {
            cube([400, 400, 500]);
          }
        }

        //remove low part
        calf_mid_bottom_base() {
          translate([-200, -200, -500]) {
            cube([400, 400, 500]);
          }
        }
      }

      //aligment hole -> calf_high
      calf_high_bottom_base() {
        difference() {
          translate([0, 0, -0.1]) {
            cylinder(r1 = 49.5, r2 = 2, h = 60);
          }

          translate([-100, -100, 30]) {
            cube([200, 200, 200]);
          }
        }
      }
    }


    //internal hole
    calf_high_bottom_base() {
      translate([0, 0, -300]) {
        cylinder(r = 15, h = 500);
      }
    }

    //screw & nut holes -> high calf
    calf_high_bottom_base() {
      translate([0, 0, 20]) {
        for(rz = [0, 90, 180, 270]) {
          rotate([90, 0, rz]) {
            translate([0, 0, 20]) {
              cylinder(r = 2.5, h = 100);
            }

            linear_extrude(height = 20) {
             nut_M4_2D();
            }
          }
        }
      }
    }

    //aligment hole
    calf_mid_bottom_base() {
      translate([0, 0, -0.1]) {
        cylinder(r1 = 40, r2 = 10, h = 60);
      }
    }

    //screw holes -> low calf
    calf_mid_bottom_base() {
      translate([0, 0, 20]) {
        for(rz = [0, 90, 180, 270]) {
          rotate([90, 0, rz]) {
            translate([0, 0, 20]) {
              cylinder(r = 2.5, h = 100);
            }

            translate([0, 0, 47]) {
              cylinder(r = 6, h = 40);
            }
          }
        }
      }
    }
  }
}


module calf_low() {
}


module calf() {
  calf_high();
  calf_mid();
  calf_low();
}
