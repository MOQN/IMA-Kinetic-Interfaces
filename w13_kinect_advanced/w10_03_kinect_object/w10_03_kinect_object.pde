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

ArrayList<Particle> particles = new ArrayList<Particle>();
int particleInterval = 0;

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
  
  colorImg = kinect2.getRegisteredImage();
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
        
        /// let's add particles here
        if (particles.size() < 500 && particleInterval <= 0) {
          particles.add( new Particle(pX,pY,pZ) );
          particleInterval = 20;
        } else {
          particleInterval--;
        }
        
        strokeWeight(pointSize);
        stroke(colorImg.pixels[i]);
        point(pX, pY, pZ);
      }
    }
  }
  depthImg.updatePixels();
  
  // we have to flip the direction of loop in order to remove the particles without an error.
  for (int i=particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    
    if (p.alpha <= 0) {
      particles.remove(i);
    }
  }
  
  if (guiToggle) drawGui();
}


void keyPressed() {
  if (key == ' ') guiToggle = !guiToggle;
}