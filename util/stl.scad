stl_dir_prefix = "";

module stl(name) {
  scale([10, 10, 10]) {
    rotate([0, 0, 90]) {
      import(str(stl_dir_prefix, "stl/", name, ".stl"));
    }
  }
}
