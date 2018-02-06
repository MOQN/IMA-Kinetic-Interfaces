// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 7 2016


PVector mouseAcc, mousePrevPos;
float threshold = 100;


void setup() {
  size(500, 500);
  frameRate(3);
  
  mouseAcc = new PVector();
  mousePrevPos = new PVector(width/2, height/2);
}


void draw() {
  background(0);
  
  PVector mouseCurrPos = new PVector(mouseX, mouseY);
  PVector vector = PVector.sub(mouseCurrPos, mousePrevPos); // static
  float magnitude = vector.mag(); // acceleration
  float angle = degrees( vector.heading() );
  if (angle < 0 ) {
    angle = 360 + angle;
  }

  float thickness = map(magnitude, 0, 100, 0, 30);
  strokeWeight(thickness);
  stroke(255);
  line(mousePrevPos.x, mousePrevPos.y, mouseCurrPos.x, mouseCurrPos.y);

  textSize(25);
  text("Magnitude: " + magnitude, 20, 40);
  text("Angle: " + angle, 20, 40+40);
  
  mousePrevPos = mouseCurrPos.copy();
}