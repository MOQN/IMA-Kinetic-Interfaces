// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 7 2016

float mouseAccX = 0;
float mouseAccY = 0;
float threshold = 100;

void setup() {
  size(500, 500);
  frameRate(5);
}


void draw() {
  background(0);

  // distance == speed (Pixel per Frame)
  float distance = dist(pmouseX, pmouseY, mouseX, mouseY);

  float thickness = map(distance, 0, 100, 0, 30);
  strokeWeight(thickness);
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);

  mouseAccX = mouseX - pmouseX;
  mouseAccY = mouseY - pmouseY;

  if (mouseAccX > threshold) {
    println("Swiped to RIGHT");
  } else if (mouseAccX < -threshold) {
    println("Swiped to LEFT");
  }

  textSize(25);
  text("AccX: " + mouseAccX, 20, 40);
  text("AccY: " + mouseAccY, 20, 40+40);
}