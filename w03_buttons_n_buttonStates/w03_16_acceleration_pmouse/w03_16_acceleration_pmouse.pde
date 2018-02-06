// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 7 2016


void setup() {
  size(500, 500);
}


void draw() {
  // trail effect
  //background(0);
  fill(0,20);
  noStroke();
  rect(0,0, width, height);
  
  // draw a line between the current mouse position
  // and previous mouse position
  strokeWeight(3);
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
}