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
      
      float sineValue = sin((x+frameCount) * 0.005); 
      
      float r = map(x, 0, img.width, 255, 0);
      float g = map(sineValue, -1, 1, 0, 255);
      float b = map(y, 0, img.height, 0, 255);
      img.pixels[index] = color(r, g, b);
      
      index++;
    }
  }
  img.updatePixels();

  image(img, 0, 0);

  textSize(20);
  text(frameRate, 10, 30);
}