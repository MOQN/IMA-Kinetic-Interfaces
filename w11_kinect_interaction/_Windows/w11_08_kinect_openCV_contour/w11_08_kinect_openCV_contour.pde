// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 11 2018


import KinectPV2.*;
import gab.opencv.*;
import controlP5.*;


OpenCV opencv;
ControlP5 cp5;

KinectPV2 kinect2;
PImage depthImg;

int thresholdMin = 0;
int thresholdMax = 4499;

ArrayList<Contour> contours;


void setup() {
  size(512, 424, P2D);

  kinect2 = new KinectPV2(this);
  kinect2.enableDepthImg(true);
  kinect2.init();

  // Blank image
  depthImg = new PImage(KinectPV2.WIDTHDepth, KinectPV2.HEIGHTDepth, ARGB);

  // Blank OpenCV Image
  opencv = new OpenCV(this, depthImg);

  // add gui
  int sliderW = 100;
  int sliderH = 20;
  cp5 = new ControlP5( this );
  cp5.addSlider("thresholdMin")
    .setPosition(10, 40)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(0)
    ;
  cp5.addSlider("thresholdMax")
    .setPosition(10, 70)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(4499)
    ;
}


void draw() {
  background(0);

  int[] rawDepth = kinect2.getRawDepthData();
  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    int depth = rawDepth[i];

    if (depth >= thresholdMin
      && depth <= thresholdMax
      && depth != 0) {

      float w = map(depth, thresholdMin, thresholdMax, 255, 100);

      depthImg.pixels[i] = color(w);
    } else {
      depthImg.pixels[i] = color(0, 0);
    }
  }
  depthImg.updatePixels();


  opencv.loadImage(depthImg);
  opencv.gray();
  opencv.threshold(50);
  opencv.erode();
  opencv.dilate();
  opencv.dilate();
  opencv.erode();
  contours = opencv.findContours();

  image(kinect2.getDepthImage(), 0, 0);
  //image(depthImg, 0, 0);
  image(opencv.getOutput(), 0, 0);


  // draw the contours
  noFill();
  
  int index = 0;
  for (Contour c : contours) {
    
    float r = map(index, 0, contours.size(), 255, 0);
    float b = map(index, 0, contours.size(), 0, 255);
    stroke(r, 0, b);
    
    c.draw();
    
    // check the code below
    //beginShape();
    //for ( PVector point : c.getPolygonApproximation().getPoints() ) {
    //  vertex(point.x, point.y);
    //}
    //endShape();
    
    index++;
  }


  fill(255);
  text(frameRate, 10, 20);
}
