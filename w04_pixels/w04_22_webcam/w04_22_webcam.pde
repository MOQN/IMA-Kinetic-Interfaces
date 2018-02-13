// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016

// from:
// https://www.processing.org/reference/libraries/video/Capture.html


import processing.video.*;

Capture cam;


void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);
    //returns something like
    //[0] "name=FaceTime HD Camera (Built-in),size=1280x720,fps=30"
    //[1] "name=FaceTime HD Camera (Built-in),size=1280x720,fps=15"
    //[2] "name=FaceTime HD Camera (Built-in),size=1280x720,fps=1"

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}


void draw() {
  if (cam.available()) {
    cam.read();
  }
  image(cam, 0, 0);
  //image(cam, 0, 0, width, height);
  

  //println(cam.width + ", " + cam.height);
}