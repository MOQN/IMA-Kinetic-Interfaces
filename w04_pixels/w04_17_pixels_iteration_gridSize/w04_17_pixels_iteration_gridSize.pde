// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Feb 12 2016


PImage img;


void setup() {
  size(800, 640);
  background(0);
  noStroke();
  //ellipseMode(CORNER);

  img = loadImage("face.png");

  int w = img.width;
  int h = img.height;
  int gridSize = 10;
  
  img.loadPixels();
  for (int y = 0; y < h; y += gridSize) {
    for (int x = 0; x < w; x += gridSize) {
      
      int index = x + y*w; // *****
      
      color c = img.pixels[index];
      float white = (red(c) + green(c) + blue(c)) / 3; // average
      
      float dia = map(white, 0, 255, 0, gridSize);
      
      fill(255);
      ellipse(x, y, dia, dia);
    }
  }
}


void draw() {
  //
}