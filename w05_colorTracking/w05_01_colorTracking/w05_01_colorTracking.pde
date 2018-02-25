// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 27 2016


import processing.video.*;


Capture cam;


void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480);
  cam.start();
}


void draw() {
  if ( cam.available() ) {
    cam.read();
    cam.loadPixels();
  }

  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // ***

      float r = red(cam.pixels[i]);
      float g = green(cam.pixels[i]);
      float b = blue(cam.pixels[i]);

      // if it's bright enough ! 
      if (r > 200 && g > 200 && b > 200) cam.pixels[i] = color(255, 0, 0);
    }
  }
  cam.updatePixels();
  image(cam, 0, 0);
}