// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;


Capture cam;
PImage mirror;


void setup() {
  size(640, 480);

  cam = new Capture(this, 640, 480);
  cam.start();
  
  mirror = createImage(width, height, RGB);
}


void draw() {
  if ( cam.available() ) {
    cam.read();
    cam.loadPixels();
  }
  
  mirror.loadPixels();
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int camIndex =  x + y*w; // IMPORTANT

      int mirrorX = cam.width-1 - x;
      int mirrorIndex = mirrorX + y*w; 
      
      mirror.pixels[mirrorIndex] = cam.pixels[camIndex];
    }
  }
  mirror.updatePixels();
  image(mirror, 0, 0);
}