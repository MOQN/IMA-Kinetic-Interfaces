// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Aug 31 2016


float btn1PosX, btn1PosY, btn1Size;
float btn2PosX, btn2PosY, btn2Size;
// if you start repeating like this it's the sign you need an array of a class(object)!


void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();

  btn1PosX = width/2-100;
  btn1PosY = height/2;
  btn1Size = 120;
  btn2PosX = width/2+100;
  btn2PosY = height/2;
  btn2Size = 80;
  // a lot of repetition...
}


void draw() {
  background(100);

  ellipse(btn1PosX, btn1PosY, btn1Size, btn1Size);
  ellipse(btn2PosX, btn2PosY, btn2Size, btn2Size);
  // oh my....
  
  float distance1 = dist(btn1PosX, btn1PosY, mouseX, mouseY);
  if ( distance1 < btn1Size/2) {
    if (mousePressed) {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
    } else {
      fill(255, 0, 0);
    }
  } else {
    noFill();
  }
  
  float distance2 = dist(btn2PosX, btn2PosY, mouseX, mouseY);
  if ( distance2 < btn2Size/2) {
    if (mousePressed) {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
    } else {
      fill(255, 0, 0);
    }
  } else {
    noFill();
  }
  // OMG! There is a bug. Please try to find it.
  // We will talk about this during the class.
  // Let's make a class then.
}





//