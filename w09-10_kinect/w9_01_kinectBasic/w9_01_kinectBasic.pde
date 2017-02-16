// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Nov 3 2016

// based on Daniel Shiffman's examples
// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect2;


void setup() {
  size(1024, 848, P2D);
  kinect2 = new Kinect2(this);
  
  kinect2.initVideo();
  kinect2.initDepth();
  kinect2.initIR();
  kinect2.initRegistered();
  
  // Start all data
  kinect2.initDevice();
}


void draw() {
  background(0);
  
  image(kinect2.getVideoImage(), 0, 0);
  //image(kinect2.getDepthImage(), 0, 0);
  //image(kinect2.getIrImage(), 0, 0);
  //image(kinect2.getRegisteredImage(), 0, 0);
  
  fill(255);
  text(frameRate, 10, 20);
  text(kinect2.colorWidth + " x " +  kinect2.colorHeight, 10, 40);
  text(kinect2.depthWidth + " x " + kinect2.depthHeight, 10, 60);
}