// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 12 2016


float fingerX, fingerY;


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
  ellipse(fingerX, fingerY, 30,30);
}