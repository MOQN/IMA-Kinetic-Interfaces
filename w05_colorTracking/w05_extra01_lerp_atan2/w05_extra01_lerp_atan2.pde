// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 28 2016

// https://en.wikipedia.org/wiki/Trigonometric_functions
// https://en.wikipedia.org/wiki/Atan2



Shape s = new Shape();


void setup() {
  size(500, 600);
  background(80);
  noStroke();
}


void draw() {
  background(80);

  // lerp
  s.x = lerp(s.x, mouseX, 0.1);
  s.y = lerp(s.y, mouseY, 0.1);

  // atan2
  float angle = atan2(mouseY - s.y, mouseX - s.x);

  // draw shape
  s.display(angle);
}


class Shape {
  float x = width/2;
  float y = height/2; 
  int w = 50;
  int h = 30;
  color clr = color(random(255), random(255), random(255));

  void display(float angle) {
    pushMatrix();
    noStroke();
    fill(clr);
    translate(x, y);
    rotate(angle);
    triangle(
      0, 0, 
      -w, h/2, 
      -w, -h/2
      );
    stroke(255);
    line(0, 0, -60, 0);
    popMatrix();
  }
}