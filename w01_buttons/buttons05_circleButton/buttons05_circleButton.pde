// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Aug 31 2016


float btnPosX, btnPosY, btnSize;


void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();

  btnPosX = width/2;
  btnPosY = height/2;
}


void draw() {
  background(100);

  //btnSize = 100;
  btnSize = sin(frameCount*0.02)*60 + 90;
  
  ellipse(btnPosX, btnPosY, btnSize, btnSize);

  float distance = dist(btnPosX, btnPosY, mouseX, mouseY);
  
  if ( distance < btnSize/2) { // radious
    if (mousePressed) {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
    } else {
      fill(255, 0, 0);
    }
  } else {
    noFill();
  }
}