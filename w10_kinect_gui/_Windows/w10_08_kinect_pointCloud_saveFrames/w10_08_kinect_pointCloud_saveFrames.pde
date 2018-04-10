// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 3 2018


import KinectPV2.*;


KinectPV2 kinect2;


void setup() {
  size(512, 424, P2D);
  
  kinect2 = new KinectPV2(this);
  kinect2.enableDepthImg(true);
  kinect2.init();
}


void draw() {
  background(0);  
  image(kinect2.getDepthImage(), 0, 0);
  
  saveFrame("data/png/frames-#####.png");
  
  text(frameRate, 10, 20);
  text(frameCount, 10, 40);
}
