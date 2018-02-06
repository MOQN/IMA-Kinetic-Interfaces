// Based on: Face It by Daniel Shiffman / ITP Fall 2013 
// https://github.com/shiffman/Face-It

// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Oct 13 2016


import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;


OpenCV opencv;
Capture cam;

Rectangle[] faces;


void setup() {
  size(320, 240, P2D);
  
  // Start capturing
  cam = new Capture(this, 320, 240);
  cam.start();

  // Create the OpenCV object
  opencv = new OpenCV(this, cam.width, cam.height);
  
  // Which "cascade" are we going to use?
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  //opencv.loadCascade(OpenCV.CASCADE_EYE);  
  //opencv.loadCascade(OpenCV.CASCADE_NOSE);    
}

// New images from camera
void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  
  background(0);
  
  // We have to always "load" the camera image into OpenCV 
  opencv.loadImage(cam);
  
  // Detect the faces
  faces = opencv.detect();
  
  // Draw the video
  image(cam, 0, 0);

  // If we find faces, draw them!
  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255,0,0);
      noFill();
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  }
}