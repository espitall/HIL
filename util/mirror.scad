module mirror(mirror = true) {
  if(mirror) {
    translate([0, -13.5, 0]) {
      scale([1, -1, 1]) {
        children();
      }
    }
  }
  else {
    children();
  }
}
