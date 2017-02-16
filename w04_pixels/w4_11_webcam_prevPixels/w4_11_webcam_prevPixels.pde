// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;

Capture cam;
PImage prevCam;
PImage img;

void setup() {
  size(640, 360);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("No cameras available.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + ": " + cameras[i]);
    }
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
  prevCam = createImage(640, 360, RGB);
  img = createImage(640, 360, RGB);
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }

  prevCam.loadPixels();
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT
      
      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      
      //initially, prevCam values are all zero
      //but the values get updated at the end of the for loop
      int prevR = int( red(prevCam.pixels[i]) );
      int prevG = int( green(prevCam.pixels[i]) );
      int prevB = int( blue(prevCam.pixels[i]) );
      
      //abs() function makes the value inside an absolute value
      //for example abs(-5) returns 5
      //if color values of current cam is same as that of prevCam
      //diff values will be 0 and display black
      int diffR = abs(r-prevR);
      int diffG = abs(g-prevG);
      int diffB = abs(b-prevB);
      
      img.pixels[i] = color(diffR*5,diffG*5,diffB*5);
      
      //update prevCam pixels to current cam pixels
      prevCam.pixels[i] = color(r,g,b); // *** Check this out!
    }
  }
  prevCam.updatePixels();
  img.updatePixels();
  
  image(img, 0, 0);
  
  //prevCam = cam;  // *** this won't work!
}