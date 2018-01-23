// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Nov 3 2016


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import controlP5.*;
import java.util.*;


ControlP5 cp5;
Kinect2 kinect2;
PImage depthImg;

int thresholdMin = 0;
int thresholdMax = 4499;


void setup() {
  size(512, 424, P2D);

  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  // Blank image
  depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);

  // add gui
  int sliderW = 100;
  int sliderH = 15;
  cp5 = new ControlP5( this );
  cp5.addSlider("thresholdMin")
    .setPosition(10, 40)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(0)
    ;
  cp5.addSlider("thresholdMax")
    .setPosition(10, 60)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(4499)
    ;
}


void draw() {
  int[] rawDepth = kinect2.getRawDepth();

  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    depthImg.pixels[i] = color(0, 0);
    if (rawDepth[i] >= thresholdMin && rawDepth[i] <= thresholdMax) {
      int x = i % kinect2.depthWidth;
      int y = floor(i / kinect2.depthWidth);

      float r = map(rawDepth[i], thresholdMin, thresholdMax, 255, 0);
      float b = map(rawDepth[i], thresholdMin, thresholdMax, 0, 255);

      depthImg.pixels[i] = color(r, 0, b);
    }
  }
  depthImg.updatePixels();

  background(0);
  image(kinect2.getDepthImage(), 0, 0);
  image(depthImg, 0, 0);

  fill(255);
  text(frameRate, 10, 20);
}