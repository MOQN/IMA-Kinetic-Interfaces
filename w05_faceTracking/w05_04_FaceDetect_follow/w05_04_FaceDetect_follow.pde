// Based on: Face It by Daniel Shiffman / ITP Fall 2013 
// https://github.com/shiffman/Face-It

// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Oct 18 2016


import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;


OpenCV opencv;
Capture cam;

Rectangle[] faces;
PImage smallerImg;
PImage croppedImg;

int scale = 4;


void setup() {
  size(800, 800);
  cam = new Capture(this, 640, 480);
  cam.start();

  opencv = new OpenCV(this, cam.width/scale, cam.height/scale);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 

  smallerImg = createImage(opencv.width, opencv.height, RGB);
}


void draw() {
  if ( cam.available() ) {
    cam.read();

    smallerImg.copy(cam, 
      0, 0, cam.width, cam.height, 
      0, 0, smallerImg.width, smallerImg.height);
    smallerImg.updatePixels();
  }

  background(0);
  //image(cam, 0, 0);

  opencv.loadImage(smallerImg);
  faces = opencv.detect();

  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      croppedImg = createImage(faces[i].width*scale, faces[i].height*scale, RGB);
      croppedImg.copy( cam, 
        faces[i].x*scale, faces[i].y*scale, 
        faces[i].width*scale, faces[i].height*scale, 
        0, 0, 
        croppedImg.width, croppedImg.height);
      croppedImg.updatePixels();
      image(croppedImg, 0, 0, width, height);
    }
  }
}