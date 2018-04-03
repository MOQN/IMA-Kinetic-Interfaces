// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 3 2018


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;


Kinect2 kinect2;
PImage depthImg;

int resolution = 3;
int thresholdMin = 1;
int thresholdMax = 4499;


void setup() {
  size(1000, 600, P3D);
  
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);
  
  initGui(); // check the "Gui" tab!
}


void draw() {
  background(0);


  pushMatrix();
  translate(width/2, height/2);
  rotateY( rotation.getArrayValue(0) ); 
  rotateX( rotation.getArrayValue(1) );

  noFill();
  stroke(255);
  box(200);

  int[] rawDepth = kinect2.getRawDepth();
  int w = kinect2.depthWidth;
  int h = kinect2.depthHeight;
  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    int x = i % w;
    int y = floor(i / w);
    int depth = rawDepth[i]; // z

    if ( depth >= thresholdMin
      && depth <= thresholdMax
      && depth != 0) {

      float r = map(depth, thresholdMin, thresholdMax, 255, 0);
      float b = map(depth, thresholdMin, thresholdMax, 0, 255);

      depthImg.pixels[i] = color(r, 0, b);

      if (x % resolution == 0 && y % resolution == 0) { 
        float pX = map(x, 0, w, -w/2, w/2) + posOffset.getArrayValue(0); 
        float pY = map(y, 0, h, -h/2, h/2) + posOffset.getArrayValue(1);
        float pZ = map(depth, 1, 4499, 500, -500);
        point(pX, pY, pZ);
      }
    } else {
      depthImg.pixels[i] = color(0, 0);
    }
    
  }
  depthImg.updatePixels();


  popMatrix();


  image(kinect2.getDepthImage(), 0, 0, kinect2.depthWidth * 0.3, kinect2.depthHeight * 0.3);
  image(depthImg, 0, 0, kinect2.depthWidth * 0.3, kinect2.depthHeight * 0.3);

  fill(255);
  text(frameRate, 10, 20);
}
