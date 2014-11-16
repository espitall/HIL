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
