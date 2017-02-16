// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 12 2016


float finger1X, finger1Y;
float finger2X, finger2Y;


void setup() {
  // OPENGL(depricated) to P3D
  size(800, 500, P3D);
  background(255);
  noStroke();
  LMSetup();
}


void draw() {
  background(255);
  LMRun();
  
  fill(255,0,0,200);
  ellipse(finger1X, finger1Y, 30,30);
  
  fill(255,255,0,200);
  ellipse(finger2X, finger2Y, 30,30);
}