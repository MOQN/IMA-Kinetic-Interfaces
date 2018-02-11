// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Feb 12 2016


PImage img;


void setup() {
  size(500, 500);
  background(0);
  
  img = loadImage("colorful.jpg");

  noStroke();
  for (int i = 0; i < 100000; i++) {

    int x = int( random(width) );
    int y = int( random(height) );
    color c = img.get(x, y);

    float dia = random(3, 15);
    fill(red(c), green(c), blue(c), 120);
    ellipse(x, y, dia, dia);
  }
}


void draw() {
  //
}