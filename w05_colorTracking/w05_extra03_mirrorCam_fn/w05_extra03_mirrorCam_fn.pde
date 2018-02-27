// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Dec 11 2016


import processing.video.*;


Capture cam;
PImage mirrorCam;


void setup() {
  size(640, 960); // 960 = 480 * 2
  
  cam = new Capture(this, 640, 480);
  cam.start();
  
  mirrorCam = createImage(640, 480, RGB);
}


void draw() {
  if ( cam.available() ) {
    cam.read();
    mirroring();
  }
  image(cam, 0,0);
  image(mirrorCam, 0,480);
}


void mirroring() {
  int w = cam.width;
  int h = cam.height;
  cam.loadPixels();
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int camIndex =  x + y*w;
      int mirrorCamIndex =  (w-1 - x) + y*w;
      mirrorCam.pixels[mirrorCamIndex] = cam.pixels[camIndex];
    }
  }
  mirrorCam.updatePixels();
}