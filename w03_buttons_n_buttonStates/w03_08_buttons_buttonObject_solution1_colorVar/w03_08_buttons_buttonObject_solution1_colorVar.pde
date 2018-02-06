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
  
  btn1.checkDistance();
  btn1.display();
  
  btn2.checkDistance();
  btn2.display();
}

class Button {
  float posX = width/2;
  float posY = height/2;
  float size = 100;
  color colorS, colorF; 
  
  Button(float x, float y) {
    posX = x;
    posY = y;
    colorS = color(255);
    colorF = color(255,0);
  }
  
  void update() {
    size = sin(frameCount*0.02)*60 + 90;
  }
  void checkDistance() {
    float distance = dist(posX, posY, mouseX, mouseY);
    if ( distance < size/2) { // radious
      if (mousePressed) {
        colorF = color(random(255), random(255), random(255));
        colorS = color(random(255), random(255), random(255));
      } else {
        colorF = color(255, 0, 0);
      }
    } else {
      colorF = color(255,0);
    }
  }
  void display() {
    pushStyle();
    
    fill(colorF);
    stroke(colorS);
    ellipse(posX, posY, size, size);
    
    popStyle();
  }
}