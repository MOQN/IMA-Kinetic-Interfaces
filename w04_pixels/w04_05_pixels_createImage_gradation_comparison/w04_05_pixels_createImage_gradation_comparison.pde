// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 12 2016

void setup() {
  size(500, 600);
  noStroke();

  int index = 0;
  int gridSize = 50;
  for (int y=0; y<height; y+=gridSize) {
    for (int x=0; x<width; x+=gridSize) {

      float r = map(index, 0, width*height/(gridSize*gridSize), 0, 255);

      fill(r, 0, 0);
      rect(x, y, gridSize, gridSize);
      fill(255);
      index++;
    }
  }
}

void draw() {
  //
}