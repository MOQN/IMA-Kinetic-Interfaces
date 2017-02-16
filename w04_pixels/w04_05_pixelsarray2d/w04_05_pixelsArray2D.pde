// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 20 2016

PImage img;

void setup() {
  size(500, 500);
  img = loadImage("colorful.jpg");
}

void draw() { 
  img.loadPixels();

  int h = img.height;
  int w = img.width;

  //for loop for incrementing y is outside of for look for incrementing x
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {

      // how do we get the index?
      int i =  x + y*w; // ********** IMPORTANT **********

      int r = int( red(img.pixels[i])); 
      int g = int( green(img.pixels[i]));
      int b = int( blue(img.pixels[i]));

      //if x coordinate of the pixel is less than 1/3 of width
      //make blue value of color zero
      if (x < width*1/3) {
        img.pixels[i] = color(r, g, 0);
      } 
      //if x coordinate of the pixel is less than 2/3 of width
      //make red value of color zero
      else if (x < width*2/3) {
        img.pixels[i] = color(0, g, b);
      } 
      //make green value of color zero for the rest
      else {
        img.pixels[i] = color(r, 0, b);
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}

void mousePressed() {
  println();
  println(mouseX + ", " + mouseY);
  color c = img.get(mouseX, mouseY);
  println(red(c) + ", " + green(c) + ", " + blue(c));
}