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
    printArray(cameras);
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
}


void draw() {
  if (cam.available()) {
    cam.read();
  }
  pushMatrix();
  //move image to the right by width
  translate(cam.width, 0);
  //then horizontally reflect
  scale(-1,1);
  image(cam, 0, 0);
  popMatrix();
}