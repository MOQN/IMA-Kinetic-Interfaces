// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Nov 3 2016


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;


Kinect2 kinect2;

int thresholdMin = 0;
int thresholdMax = 4499;
int resolution = 3;


void setup() {
  size(800, 500, P3D);
  
  noFill();
  stroke(255);
  strokeWeight(2);
  
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  setupGui();
}


void draw() {
  background(0);
  
  int[] rawDepth = kinect2.getRawDepth();
  
  pushMatrix();
  translate(width/2, height/2);
  float rY = map(mouseX, 0, width, -180, 180) + 180;
  rotateY(radians(rY));
  for (int i=0; i < rawDepth.length; i+=resolution) {
    if (rawDepth[i] >= thresholdMin && rawDepth[i] <= thresholdMax && rawDepth[i] != 0) {
      int x = i % kinect2.depthWidth;
      int y = floor(i / kinect2.depthWidth);
      
      float mappedX = map(x, 0, kinect2.depthWidth, -kinect2.depthWidth*0.3, kinect2.depthWidth*0.3);
      float mappedY = map(y, 0, kinect2.depthHeight, -kinect2.depthHeight*0.3, kinect2.depthHeight*0.3);
      float mappedZ = map(rawDepth[i], 0, 4499, -900+mouseY, 900+mouseY);
      
      point(mappedX,mappedY,mappedZ);
    }
  }
  popMatrix();
  
  //image(kinect2.getDepthImage(), 0, 0);

  fill(255);
  text(frameRate, 10, 20);
}