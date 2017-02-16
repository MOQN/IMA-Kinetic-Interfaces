// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Aug 31 2016


int boxPosX = 100;
int boxPosY = 100;
int boxWidth = 50;
int boxHeight = 50;


void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();
}


void draw() {
  background(100);
  
  rect(boxPosX, boxPosY, boxWidth, boxHeight);

  if (mouseX > boxPosX && mouseX < boxPosX+boxWidth &&
    mouseY > boxPosY && mouseY < boxPosY+boxHeight) {
    fill(255, 0, 0);
  } else {
    noFill();
  }
}