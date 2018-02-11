// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Feb 12 2016


PImage img;


void setup() {
  size(800, 640);
  background(0);
  noStroke();

  img = loadImage("face.png");

  int w = img.width;
  int h = img.height;
  int gridSize = 10;
  
  img.loadPixels();
  for (int y = 0; y < h; y += gridSize) {
    for (int x = 0; x < w; x += gridSize) {
      
      int index = x + y*w; // *****
      
      color c = img.pixels[index];
      fill(c);
      ellipse(x, y, gridSize, gridSize);
    }
  }
}


void draw() {
  //
}