// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 12 2018

PImage img;

void setup() {
  size(500, 600);
  noStroke();

  img = createImage(width, height, RGB); // ARGB
}


void draw() {
  background(0);

  int index = 0;
  img.loadPixels();
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      
      // get the distance from the center to the pixel
      float distance = dist(img.width/2, img.height/2, x, y);
      
      float r = map(distance, 0, 400, 0, 255);
      float g = 0;
      float b = map(distance, 0, 400, 255, 0);
      img.pixels[index] = color(r, g, b);
      
      index++;
    }
  }
  img.updatePixels();

  image(img, 0, 0);

  textSize(20);
  text(frameRate, 10, 30);
}