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
  
  img.loadPixels(); // Search for this keyword: "FBO" and "GPU"
  
  // println(img.pixels.length); // img.width * img.height
  for (int i=0; i<img.pixels.length; i++) {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    img.pixels[i] = color(r,g,b);
  }
  img.updatePixels();
  
  image(img, 0, 0);
  
  textSize(20);
  text(frameRate, 10, 30);
}