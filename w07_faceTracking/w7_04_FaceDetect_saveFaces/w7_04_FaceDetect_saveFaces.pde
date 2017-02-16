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
PImage smallerImg;


int scale = 4;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480);
  cam.start();

  opencv = new OpenCV(this, cam.width/scale, cam.height/scale);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 

  smallerImg = createImage(opencv.width, opencv.height, RGB);
}

void captureEvent(Capture cam) {
  cam.read();

  smallerImg.copy(cam, 
    0, 0, cam.width, cam.height, 
    0, 0, smallerImg.width, smallerImg.height);
  smallerImg.updatePixels();
}

void draw() {

  background(0);

  // We have to always "load" the  image into OpenCV 
  // But we check against the smallerImg image here
  opencv.loadImage(smallerImg);


  faces = opencv.detect();

  image(cam, 0, 0);

  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255, 0, 0);
      noFill();
      rect(faces[i].x*scale, faces[i].y*scale, faces[i].width*scale, faces[i].height*scale);
    }
  }
}


void keyPressed() {
  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      PImage croppedImg = createImage(faces[i].width*scale, faces[i].height*scale, RGB);
      croppedImg.copy(cam, 
        faces[i].x*scale, faces[i].y*scale, faces[i].width*scale, faces[i].height*scale, 
        0, 0, croppedImg.width, croppedImg.height);
      croppedImg.updatePixels();
      croppedImg.save("faces/face-"+i+".jpg");
    }
  }
}