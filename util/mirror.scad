module mirror(mirror = true) {
  if(mirror) {
    translate([0, -11, 0]) {
      scale([1, -1, 1]) {
        children();
      }
    }
  }
  else {
    children();
  }
}
