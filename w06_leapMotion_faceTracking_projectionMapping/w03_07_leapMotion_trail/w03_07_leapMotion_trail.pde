// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 18 2016


float pfingerIX, pfingerIY;
float fingerIX, fingerIY;
float fingerTX, fingerTY;


void setup() {
  size(800, 500);
  background(0);
  noStroke();
  LMsetup();
}


void draw() {
  // background(0);
  // instead fo the background() function
  fill(0,10);
  rect(0, 0, width, height);

  LMdraw();
  
  fill(255);
  ellipse(fingerIX, fingerIY, 40, 40);
  
  // text(fingerIX, 10, 20);
  // You might not be able to read the text because of the background color.
  
  pfingerIX = fingerIX;
  pfingerIY = fingerIY;
}