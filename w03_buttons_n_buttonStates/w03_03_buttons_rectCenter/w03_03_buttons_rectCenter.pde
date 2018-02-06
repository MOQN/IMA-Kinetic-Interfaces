// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Aug 31 2016


int boxPosX, boxPosY;
float boxWidth, boxHeight;


void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();
  
  rectMode(CENTER);
  
  boxPosX = width/2;
  boxPosY = height/2;
}


void draw() {
  background(100);
  
  boxWidth = sin(frameCount*0.02)*60 + 90;
  boxHeight = sin(frameCount*0.05)*50 + 100;
  rect(boxPosX, boxPosY, boxWidth, boxHeight);

  if (mouseX > boxPosX-boxWidth/2 && mouseX < boxPosX+boxWidth/2 &&
    mouseY > boxPosY-boxHeight/2 && mouseY < boxPosY+boxHeight/2) {
    fill(255, 0, 0);
  } else {
    noFill();
  }
}