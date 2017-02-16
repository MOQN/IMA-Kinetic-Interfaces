// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;

Capture cam;
PImage img;

PImage sampleColorImg;
//create an array of size 766
//766 because this is the width of gradationSample.png
//which we load to sampleColorImg in the setup below
color[] sampleColors = new color[766];

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
  img = createImage(640, 360, RGB); //ARGB  //not RGBA
  
  // load sample colors
  sampleColorImg = loadImage("gradationSample.png");
  int w = sampleColorImg.width;
  sampleColorImg.loadPixels();
  for (int i = 0; i < w; i++) {
    sampleColors[i] = sampleColorImg.pixels[i];
  }
  //now sampeColors array contains 766 colors loaded from gradationSample.png
  sampleColorImg.updatePixels();
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }

  // webcam
  int w = cam.width;
  int h = cam.height;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      int sum = r+g+b; // this becomes index
      //if color value is white (255, 255, 255)
      //sum = 765 
      //so it will use samplecolors[255] color to load to PImage img

      img.pixels[i] = sampleColors[sum];
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}