// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;

Capture cam;
PImage img;

PImage sampleColorImg;
//create an array of size 768
//The number 768 is from the width of gradationSample.png
color[] sampleColors = new color[768];

void setup() {
  size(640, 480);
  
  cam = new Capture(this, width, height);
  cam.start();
  
  img = createImage(width, height, RGB); //ARGB  //not RGBA
  
  // load sample colors
  sampleColorImg = loadImage("gradationSample.png");
  int w = sampleColorImg.width;
  sampleColorImg.loadPixels();
  for (int i = 0; i < w; i++) {
    sampleColors[i] = sampleColorImg.pixels[i];
  }
  //now sampeColors array contains 768 colors loaded from gradationSample.png
  sampleColorImg.updatePixels();
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }

  int w = cam.width;
  int h = cam.height;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      int sum = r+g+b; // this becomes the index of the sampleColors array
      
      //if the color value is white (255, 255, 255)
      //the sum value will be 765.
      //Teh sum 765 can be used as an index of the sampleColors array.
      img.pixels[i] = sampleColors[sum];
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}