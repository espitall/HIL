module nut_2D(E = 7.2) {

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

module nut_insert_2D(E = 7.2, shift = 20) {

  E2 = E / 2;
  x0 = E / (2 * sqrt(3));
  x1 = x0 * 2;

  polygon(points = [
          [shift, E2],
          [shift, -E2],
          [-x0, -E2],
          [-x1, 0],
          [-x0, E2],
  ]);
}

module nut_M25_2D() {
  nut_2D(E = 5);
}

module nut_M3_2D() {
  nut_2D(E = 5.5);
}

module nut_M4_2D() {
  nut_2D(E = 7.2);
}

module nut_M4_insert(height = 3.5, shift = 20, margin = 0.5) {
  linear_extrude(height = height) {
    nut_insert_2D(E = 7.2 + margin, shift = shift);
  }
}

module nut_M3_insert(height = 3.5, shift = 20, margin = 0.5) {
  linear_extrude(height = height) {
    nut_insert_2D(E = 5.5 + margin, shift = shift);
  }
}
