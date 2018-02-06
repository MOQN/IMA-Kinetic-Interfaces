// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 5 2018

Button btn;

void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();

  btn = new Button(width/2, height/2);
}


void draw() {
  background(100);

  btn.update();
  btn.display();
}