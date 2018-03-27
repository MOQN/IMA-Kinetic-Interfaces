// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Mar 28 2018


import KinectPV2.*;

KinectPV2 kinect2;


void setup() {
  size(1024, 848, P2D); // (512 x 424)
  
  kinect2 = new KinectPV2(this);
  
  kinect2.enableColorImg(true);
  kinect2.enableDepthImg(true);
  kinect2.enableInfraredImg(true);
  
  // Start all data
  kinect2.init();
}


void draw() {
  background(0);
  
  //image(kinect2.getColorImage(), 0, 0);
  image(kinect2.getDepthImage(), 0, 0);
  //image(kinect2.getInfraredImage(), 0, 0);
  
  fill(255);
  text(frameRate, 10, 20);
  text(KinectPV2.WIDTHColor + " x " + KinectPV2.HEIGHTColor, 10, 40);
  text(KinectPV2.WIDTHDepth + " x " + KinectPV2.HEIGHTDepth, 10, 60);
}
