// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;

Capture cam;


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
    cam = new Capture(this, cameras[3]); // index[3]: 640x480, 30fps
    cam.start();
  }
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      
      int i =  x + y*w; // IMPORTANT
      
      int r = int( red(cam.pixels[i])); 
      int g = int( green(cam.pixels[i]));
      int b = int( blue(cam.pixels[i]));
      
      int avg = (r+g+b)/3; // the average == grayscale value
      //if x coordinate is less than half of the width
      //grayscale the color value of the pixel
      if (x < width/2) {
        cam.pixels[i] = color(avg);
      }
    }
  }
  cam.updatePixels();
  image(cam, 0, 0);
}