// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 7 2016


void setup() {
  size(500, 500);
}


void draw() {
  // trail effect
  fill(0,20);
  noStroke();
  rect(0,0, width, height);
  
  // distance == speed (px per frame)
  float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  float thickness = map(distance, 0, 100, 30, 1);
  thickness = constrain(thickness, 1, 30);
  strokeWeight(thickness);
  
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
}