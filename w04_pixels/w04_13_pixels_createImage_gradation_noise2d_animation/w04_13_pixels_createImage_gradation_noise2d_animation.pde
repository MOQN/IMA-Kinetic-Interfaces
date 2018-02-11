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

      float freq = 0.01;
      float noiseValue = noise( (x+frameCount) * freq, (y+frameCount) * freq ); // range: 0 - 1; 

      float w = map(noiseValue, 0, 1, 0, 255);
      img.pixels[index] = color(w);

      index++;
    }
  }
  img.updatePixels();

  image(img, 0, 0);

  textSize(20);
  text(frameRate, 10, 30);
}