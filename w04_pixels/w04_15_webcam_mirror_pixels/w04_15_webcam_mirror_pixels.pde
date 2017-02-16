// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;

Capture cam;
PImage mirror;

void setup() {
  size(640, 360);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("No cameras available.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + ": " + cameras[i]);
    }
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
  mirror = createImage(640, 360, RGB); //ARGB, if you want to add alpha  //not RGBA
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  mirror.loadPixels();
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT
      
      //make right most pixel in the cam object
      //become the left most pixel in the mirror PImage
      int mirrorX = cam.width-1 - x;
      int mirrorIndex = mirrorX + y*w; 
      //update mirrored pixels to the PImage mirror
      mirror.pixels[mirrorIndex] = cam.pixels[i];
    }
  }
  mirror.updatePixels();
  image(mirror, 0, 0);
}