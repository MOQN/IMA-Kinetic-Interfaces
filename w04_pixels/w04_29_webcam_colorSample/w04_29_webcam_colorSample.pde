// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;

Capture cam;
PImage img;

PImage sampleColorImg;
color[] sampleColors;


void setup() {
  size(640, 480);

  cam = new Capture(this, width, height);
  cam.start();

  // load sampleColors image
  sampleColorImg = loadImage("gradationSample.png");

  // create an array of size 766
  // The number 766 is from the width of gradationSample.png
  sampleColors = new color[sampleColorImg.width];

  sampleColorImg.loadPixels();
  for (int i = 0; i < sampleColorImg.width; i++) {
    sampleColors[i] = sampleColorImg.pixels[i];
  }

  // create a blank image for the pixel manipulation
  img = createImage(width, height, RGB); //ARGB
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
      int sum = r + g + b; // this will become the index of the sampleColors array

      // if the color value is white (255, 255, 255), the sum value will be 765.
      // if the color value is black (0, 0, 0), the sum value will be 0.
      // so the range of the sum is from 0 to 765.
      // so the length of the color sample array should be 766. (765 + 1(including zero)) 

      // Again, the sum can be used as an index of the sampleColors array.
      img.pixels[i] = sampleColors[sum];
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}