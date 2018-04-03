// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Mar 28 2018


import KinectPV2.*;

KinectPV2 kinect2;
PImage depthImg;

int resolution = 3;
int thresholdMin = 1;
int thresholdMax = 4499;

ArrayList<Particle> particles = new ArrayList<Particle>(); 


void setup() {
  size(800, 600, P3D);
  strokeWeight(2);

  kinect2 = new KinectPV2(this);
  kinect2.enableDepthImg(true);
  kinect2.init();

  depthImg = new PImage(KinectPV2.WIDTHDepth, KinectPV2.HEIGHTDepth, ARGB);
}


void draw() {
  background(0);


  pushMatrix();
  translate(width/2, height/2);
  rotateY(frameCount * 0.01);

  int[] rawDepth = kinect2.getRawDepthData();
  int w = KinectPV2.WIDTHDepth;
  int h = KinectPV2.HEIGHTDepth;
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

        float pX = map(x, 0, w, -w/2, w/2); 
        float pY = map(y, 0, h, -h/2, h/2);
        float pZ = map(depth, 1, 4499, 500, -500);

        //stroke(c);
        //point(pX, pY, pZ);
        particles.add( new Particle(pX, pY, pZ, color(255)) );
      }
    } else {
      depthImg.pixels[i] = color(0, 0);
    }
  }
  depthImg.updatePixels();

  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.move();
    p.display();
  }

  while (particles.size() > 3000) {
    particles.remove(0);
  }

  popMatrix();


  image(kinect2.getDepthImage(), 0, 0, w * 0.3, h * 0.3);
  image(depthImg, 0, 0, w * 0.3, h * 0.3);

  fill(255);
  text(frameRate, 10, 20);
  text(particles.size(), 10, 40);
}


void mousePressed() {
  thresholdMin = (int)map(mouseX, 0, width, 0, 4499);
}


void mouseDragged() {
  thresholdMax = (int)map(mouseX, 0, width, 0, 4499);
}
