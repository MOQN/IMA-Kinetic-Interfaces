// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 28 2016


float circleX, circleY, destX, destY;


void setup() {
  size(640, 360);
  noStroke();
}


void draw() {
  background(50);

  //circleX = circleX + (mouseX-circleX)*0.05;
  //circleY = circleY + (mouseY-circleY)*0.05;

  circleX = lerp(circleX, destX, 0.05);
  circleY = lerp(circleY, destY, 0.05);

  fill(0, 255, 0);
  ellipse(circleX, circleY, 50, 50);

  fill(255, 0, 0);
  ellipse(destX, destY, 5, 5);
}


void mousePressed() {
  destX = mouseX;
  destY = mouseY;
}