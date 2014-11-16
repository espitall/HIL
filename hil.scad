include <foot/foot.scad>
include <leg/leg.scad>

debug_disable_gears = false;

module inmoov_hil() {
  union() {
    //foot_right();
	 //foot_left();
    leg_right();
    //leg_left();
  }
}

inmoov_hil();
