// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Feb 12 2016


PImage img;


void setup() {
  size(800, 640);
  background(0);
  noStroke();

  img = loadImage("face.png");

  int w = img.width;
  int h = img.height;

  img.loadPixels();
  for (int y = 0; y < h; y ++) {
    for (int x = 0; x < w; x ++) {

      int index = x + y*w; // *****

      color c = img.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      if (x < w/2) {
        if (r > 200) {
          img.pixels[index] = color(155 + random(100), 0, 0);
        } else {
          img.pixels[index] = color(0);
        }
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}


void draw() {
  //
}