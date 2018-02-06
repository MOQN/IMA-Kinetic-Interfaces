// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 5 2018

Button btn1;
Button btn2;

void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();

  btn1 = new Button(width/2 - 100, height/2);
  btn2 = new Button(width/2 + 100, height/2);
}


void draw() {
  background(100);

  btn1.checkState();
  btn1.display();

  btn2.checkState();
  btn2.display();
}

class Button {
  float posX = width/2;
  float posY = height/2;
  float size = 100;
  int state = 0;
  /** 
   state
   0: not pressed
   1: hover
   2: on press
   **/

  Button(float x, float y) {
    posX = x;
    posY = y;
  }

  void update() {
    size = sin(frameCount*0.02)*60 + 90;
  }
  void checkState() {
    float distance = dist(posX, posY, mouseX, mouseY);
    if ( distance < size/2) { // radious
      if (mousePressed) {
        state = 2;
      } else {
        state = 1;
      }
    } else {
      state = 0;
    }
  }
  void display() {
    pushStyle();

    switch (state) {
    case 0:
      noFill();
      stroke(255);
      ellipse(posX, posY, size, size);
      break;
    case 1:
      fill(255, 100);
      stroke(255);
      ellipse(posX, posY, size * 1, size * 1);
      ellipse(posX, posY, size * 1.1, size * 1.1);
      break;
    case 2:
      fill(255,0,0);
      noStroke();
      ellipse(posX, posY, size * 0.9, size * 0.9);
      break;
    }

    popStyle();
  }
}