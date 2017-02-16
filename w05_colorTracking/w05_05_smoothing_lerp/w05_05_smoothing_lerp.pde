// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 28 2016

float circleX, circleY;

void setup() {
  size(640, 360);
  background(50);
  noStroke();
}

void draw() {
  background(50);
  
  //circleX = circleX + (mouseX-circleX)*0.05;
  //circleY = circleY + (mouseY-circleY)*0.05;
  
  // equivalent
  circleX = lerp(circleX, mouseX, 0.05);
  circleY = lerp(circleY, mouseY, 0.05);
  
  fill(255,0,255);
  ellipse(circleX, circleY, 100,100);
}