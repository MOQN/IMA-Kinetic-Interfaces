// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 12 2016


float pFinger1X, pFinger1Y;
float finger1X, finger1Y;
float finger2X, finger2Y;


void setup() {
  size(800, 500);
  background(255);
  LMSetup();
}


void draw() {
  LMRun();
  
  // distance between thumb and index
  float distance = dist(finger1X,finger1Y,finger2X,finger2Y);
  if (distance < 30) {
    background(255);
  }
  
  // distance between previous and current index position 
  float accel = dist(pFinger1X,pFinger1Y,finger1X,finger1Y);
   
  stroke(255,0,0,200);
  strokeWeight(accel*0.6);
  line(pFinger1X,pFinger1Y,finger1X,finger1Y);
  //fill(255,0,0,200);
  //noStroke();
  //ellipse(finger1X, finger1Y, accel*0.6,accel*0.6);
  
  // save the current finger position
  pFinger1X = finger1X;
  pFinger1Y = finger1Y;
}