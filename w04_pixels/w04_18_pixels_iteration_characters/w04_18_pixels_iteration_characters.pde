// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Feb 14 2016


PImage img;
String[] characters = {" ", ".", "~", "!", "*", "m", "%", "&", "M", "@"};

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
      float white = (red(c) + green(c) + blue(c)) / 3; // average
      
      int charIndex = floor( map(white, 0, 255, 0, characters.length-1) );
      
      fill(255);
      textSize(gridSize);
      text(characters[charIndex], x, y);
    }
  }
}


void draw() {
  //
}