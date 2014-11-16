module mirror(mirror = true) {
  if(mirror) {
    scale([1, -1, 1]) {
      children();
    }
  }
  else {
    children();
  }
}
