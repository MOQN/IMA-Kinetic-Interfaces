// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Feb 14 2018


import processing.video.*;

Capture cam;
String[] characters = {" ", ".", "~", "!", "*", "m", "%", "&", "M", "@"};

void setup() {
  size(640, 480);
  noStroke();
  ellipseMode(CORNER);

  cam = new Capture(this, width, height);
  cam.start();
}


void draw() {
  background(0);

  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }

  //adjust gridSize to make more coarse grid of circles
  int gridSize = 10;
  int w = cam.width;
  int h = cam.height;
  //increment by gridSize to create grid of circles
  for (int y = 0; y < h; y+=gridSize) {
    for (int x = 0; x < w; x+=gridSize) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      float white = (r + g + b) / 3; // average

      int charIndex = floor( map(white, 0, 255, 0, characters.length-1) );

      fill(255);
      textSize(gridSize);
      text(characters[charIndex], x, y);
    }
  }
}