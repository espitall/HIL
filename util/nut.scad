module nut_M4_2D() {
  E = 7.2;

  E2 = E / 2;
  x0 = E / (2 * sqrt(3));
  x1 = x0 * 2;

  polygon(points = [
    [x0, E2],
    [x1, 0],
    [x0, -E2],
    [-x0, -E2],
    [-x1, 0],
    [-x0, E2],
  ]);
}

module nut_M4_insert(height = 3.5, shift = 20, margin = 0.5) {
  E = 7.2 + margin;

  E2 = E / 2;
  x0 = E / (2 * sqrt(3));
  x1 = x0 * 2;

  linear_extrude(height = height) {
    polygon(points = [
            [shift, E2],
            [shift, -E2],
            [-x0, -E2],
            [-x1, 0],
            [-x0, E2],
    ]);
  }
}
