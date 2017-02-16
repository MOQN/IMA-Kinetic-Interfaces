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
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
  noStroke();
  ellipseMode(CORNER);
}


void draw() {
  background(0);
  
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  
  //adjust circleSize to make more coarse grid of circles
  int circleSize = 15;
  int w = cam.width;
  int h = cam.height;
  //increment by circleSize to create grid of circles
  for (int y = 0; y < h; y+=circleSize) {
    for (int x = 0; x < w; x+=circleSize) {
      int i =  x + y*w; // IMPORTANT
      
      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      
      fill(r,g,b);
      //draw ellipses using color values from cam
      ellipse(x,y,circleSize,circleSize);
    }
  }
}