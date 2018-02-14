// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 14 2016


import processing.video.*;


Capture cam;
PImage img;

color[] sampleColors = new color[766];  // 766 = 255*3 + 1 


void setup() {
  size(640, 480);

  cam = new Capture(this, width, height);
  cam.start();

  img = createImage(width, height, RGB);
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }


  // update the sampleColors array
  int sampleColorWidth = sampleColors.length;
  for (int i = 0; i < sampleColorWidth; i++) {

    float amp = 1; 
    float freq = (i+frameCount) * 0.02;
    float sineValue = sin(freq) * amp;

    float r = map(i, 0, sampleColorWidth, 0, 255);
    float g = map(sineValue, -1, 1, 0, 255);
    float b = map(i, 0, sampleColorWidth, 255, 0);

    sampleColors[i] = color(r, g, b);
  }


  // run pixel manipulation
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
      // so the range of the some is from 0 to 765.
      // So the length of the color sample array should be 766. (765 + 1(including zero)) 
      
      // Again, the sum can be used as an index of the sampleColors array.
      img.pixels[i] = sampleColors[sum];
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}