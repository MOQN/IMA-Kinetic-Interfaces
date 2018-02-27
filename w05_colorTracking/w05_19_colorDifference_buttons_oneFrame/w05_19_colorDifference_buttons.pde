// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;


Capture cam;
PImage prevCam;
PImage img;

Button btn;

float threshold = 200;


void setup() {
  size(640, 480);

  cam = new Capture(this, 640, 480);
  cam.start();

  prevCam = createImage(cam.width, cam.height, RGB);
  img = createImage(cam.width, cam.height, RGB);
  
  btn = new Button( width * 0.8, height/2, 50 );
}


void draw() {
  if (cam.available()) {
    cam.read();

    cam.loadPixels();
    prevCam.loadPixels();

    int h = cam.height;
    int w = cam.width;

    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        int i =  x + y*w; // IMPORTANT

        float currR = red(cam.pixels[i]);
        float currG = green(cam.pixels[i]);
        float currB = blue(cam.pixels[i]);

        float prevR = red(prevCam.pixels[i]);
        float prevG = green(prevCam.pixels[i]);
        float prevB = blue(prevCam.pixels[i]);

        float diffR = abs(currR - prevR);
        float diffG = abs(currG - prevG);
        float diffB = abs(currB - prevB);

        float diffSum = diffR + diffG + diffB;
        if (diffSum > threshold) { 
          img.pixels[i] = color(255);
          
          btn.checkDistance(x, y);                   // ***
          
        } else {
          img.pixels[i] = color(0);
        }
      }
    }

    img.updatePixels();

    //prevCam = cam.copy(); // moved to the keyPressed() function
  }
  
  
  image(img, 0, 0);
  image(cam, 0, 0, 160, 120);
  image(prevCam, 0, 120, 160, 120);
  
  
  // button
  btn.updateHitState();
  btn.display();
  
}


void keyPressed() {
  prevCam = cam.copy();
}