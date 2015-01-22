include <torso_pelvis.scad>

module torso() {
  torso_pelvis(false); //right
  torso_pelvis(true); //left
}
