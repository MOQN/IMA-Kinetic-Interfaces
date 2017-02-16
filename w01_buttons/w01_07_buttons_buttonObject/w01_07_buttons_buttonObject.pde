// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Aug 31 2016


class Button {
  float posX = width/2;
  float posY = height/2;
  float size = 100;

  void update() {
    size = sin(frameCount*0.02)*60 + 90;
  }
  void checkDistance() {
    float distance = dist(posX, posY, mouseX, mouseY);
    if ( distance < size/2) { // radious
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
  void display() {
    ellipse(posX, posY, size, size);
  }
}

Button btn1;
Button btn2;
// let's talk about Array and ArrayList later.


void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();
  
  btn1 = new Button();
  btn2 = new Button();
}


void draw() {
  background(100);
  
  btn1.checkDistance();
  btn2.checkDistance();
  btn1.display();
  btn2.display();
  
  // now the buttons are at the same place which is the center. How to move them individually?
  // Let's talk during the class!
}