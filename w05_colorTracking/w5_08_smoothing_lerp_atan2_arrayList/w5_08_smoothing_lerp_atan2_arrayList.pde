// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 28 2016


class Shape {
  float x = width/2;
  float y = height/2; 
  int w = 50;
  int h = 30;
  color clr = color(random(255), random(255), random(255));
  float lerpValX = random(0.005, 0.1);
  float lerpValY = random(0.005, 0.1);
  
  void update() {
    /* check this out */
    x = lerp(x, mouseX, lerpValX);
    y = lerp(y, mouseY, lerpValY);
  }
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
    line(0, 0, -70, 0);
    popMatrix();
  }
}

ArrayList<Shape> shapes = new ArrayList<Shape>();


void setup() {
  size(500, 600);
  background(80);
  noStroke();

  for (int i=0; i<30; i++) {
    shapes.add( new Shape() );
  }
}

void draw() {
  background(80);

  for (Shape s : shapes) { 
    s.update();
    // atan2
    float angle = atan2(mouseY - s.y, mouseX - s.x);
    s.display(angle);
  }
  
}