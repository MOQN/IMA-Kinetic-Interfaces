// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 20 2016


void setup() {
  size(500, 600);
  noStroke();
}


void draw() {
  int gridSize = 2; // if 1, it will be extremely slow.
  for (int y=0; y<height; y+=gridSize) {
    for (int x=0; x<width; x+=gridSize) {
      fill(random(255), random(255), random(255));
      rect(x, y, gridSize, gridSize);
      fill(255);
    }
  }
  
  textSize(20);
  text(frameRate, 10, 30);
}