// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 18 2016


float pfingerX, pfingerY;
float fingerX, fingerY;


void setup() {
  size(800, 500);
  background(0);
  noStroke();
  
  LeapMotion_setup();
}


void draw() {
  // background(0);
  // instead of clearing the background everyframe
  // draw a rect with certain transparency
  fill(0,10);
  rect(0, 0, width, height);

  LeapMotion_run();
  
  fill(255);
  ellipse(fingerX, fingerY, 40, 40);
  
  pfingerX = fingerX;
  pfingerY = fingerY;
}