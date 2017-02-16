// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 28 2016

float circleX, circleY, destX, destY;


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
  circleX = lerp(circleX, destX, 0.02);
  circleY = lerp(circleY, destY, 0.02);
  
  fill(255,0,255);
  ellipse(circleX, circleY, 100,100);
  
  fill(255,0,0);
  ellipse(destX, destY, 5,5);
}

void mousePressed() {
  destX = mouseX;
  destY = mouseY;
}