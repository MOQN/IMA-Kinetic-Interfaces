// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Nov 10 2016

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect2;
PImage depthImg;
PImage colorImg;

void setup() {
  size(1000, 600, P3D);
  setupPeasyCam();
  setupGui();

  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initRegistered();
  kinect2.initDevice();

  // Blank image
  depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);
}


void draw() {
  background(0);
  
  // don't forget we have to loadPixels() from the RegisteredImage
  colorImg = kinect2.getRegisteredImage().copy();
  colorImg.loadPixels();
  
  int[] rawDepth = kinect2.getRawDepth();
  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    depthImg.pixels[i] = color(0, 0);
    if (rawDepth[i] >= thresholdMin && rawDepth[i] <= thresholdMax && rawDepth[i] != 0) {
      
      float r = map(rawDepth[i], thresholdMin, thresholdMax, 255, 0);
      float b = map(rawDepth[i], thresholdMin, thresholdMax, 0, 255);
      depthImg.pixels[i] = color(r, 0, b);

      int x = i % kinect2.depthWidth;
      int y = floor(i / kinect2.depthWidth);
      if (x%resolution == 0 && y%resolution == 0) {
        float pX = map(x, 0, kinect2.depthWidth, -kinect2.depthWidth/2, kinect2.depthWidth/2);
        float pY = map(y, 0, kinect2.depthHeight, -kinect2.depthHeight/2, kinect2.depthHeight/2);
        float pZ = map(rawDepth[i], 0, 4499, 600, -600) + y_offset;
        
        strokeWeight(pointSize);
        // here we change the points' colors to the registered image's colors 
        stroke(colorImg.pixels[i]);
        point(pX, pY, pZ);
      }
    }
  }
  depthImg.updatePixels();
  
  if (guiToggle) drawGui();
}


void keyPressed() {
  if (key == ' ') guiToggle = !guiToggle;
}
