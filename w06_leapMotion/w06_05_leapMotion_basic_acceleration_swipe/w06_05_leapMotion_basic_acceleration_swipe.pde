// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 12 2016


float pFingerX, pFingerY;
float fingerX, fingerY;

int threshold = 30;


void setup() {
  size(800, 500);
  background(255);
  LeapMotion_setup();
}


void draw() {
  background(0);
  
  LeapMotion_run();
  
  // distance between the previous and current index position 
  float accel = dist(pFingerX,pFingerY,fingerX,fingerY);
  
  if (accel > threshold) {
    println("Swiped!");
    println("x: " + (fingerX - pFingerX) );
    println("y: " + (fingerY - pFingerY) );
    println();
  }
  
  stroke(255,0,0,200);
  strokeWeight(accel*0.6);
  line(pFingerX,pFingerY,fingerX,fingerY);
  
  // save the current finger position
  pFingerX = fingerX;
  pFingerY = fingerY;
}