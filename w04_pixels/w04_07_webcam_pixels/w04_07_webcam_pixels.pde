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
    // this is equivalent to:  printArray(cameras);
    
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
}


void draw() {
  if (cam.available()) {
    cam.read();
    //can load pixels of camera input
    //just like how we load pixels of an image
    cam.loadPixels();
  }
  
  int w = cam.width;
  int h = cam.height;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // ********** IMPORTANT **********
      
      int r = int( red(cam.pixels[i])); 
      int g = int( green(cam.pixels[i]));
      int b = int( blue(cam.pixels[i]));
      
      if (x < width*1/3) {
        cam.pixels[i] = color(r, g, 0);
      } else if (x < width*2/3) {
        cam.pixels[i] = color(0, g, b);
      } else {
        cam.pixels[i] = color(r, 0, b);
      }
    }
  }
  cam.updatePixels();
  image(cam, 0, 0);
}