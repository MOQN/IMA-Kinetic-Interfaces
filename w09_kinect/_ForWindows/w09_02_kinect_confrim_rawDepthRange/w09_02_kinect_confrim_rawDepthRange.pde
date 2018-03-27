// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Mar 28 2018


import KinectPV2.*;

KinectPV2 kinect2;


void setup() {
  size(512, 424, P2D);
  
  kinect2 = new KinectPV2(this);

  kinect2.enableDepthImg(true);
  
  // Start all data
  kinect2.init();
}


void draw() {
  // get the raw depth data from KinectV2
  int [] rawDepth = kinect2.getRawDepthData();
  
  int min = 100000;
  int max = 0;
  for (int i=0; i < rawDepth.length; i++) {
    if (min > rawDepth[i]) {
      min = rawDepth[i];
    }
    if (max < rawDepth[i]) {
      max = rawDepth[i];
    }
  }
  // by getting the minimum and maxumum of the rawDepth value
  // we can confirm that the range of depth value frome kinectV2 is 0 to 4499
  // 0m to 4.5m approximately 
  
  background(0);
  image(kinect2.getDepthImage(), 0, 0);
  
  fill(255);
  text(frameRate, 10, 20);
  text(rawDepth.length, 10, 60); // 217088 = 512(w) * 424(h)
  text(min, 10, 80);
  text(max, 10, 100);
}
