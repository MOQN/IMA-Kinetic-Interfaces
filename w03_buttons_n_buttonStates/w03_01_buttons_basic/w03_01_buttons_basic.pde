// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Aug 31 2016


void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();
}


void draw() {
  background(100);
  rect(100, 200, 50, 50);

  if (mouseX > 100 && mouseX < 100+50 &&
    mouseY > 200 && mouseY < 200+50) {
    fill(255, 0, 0);
  } else {
    noFill();
  }
}