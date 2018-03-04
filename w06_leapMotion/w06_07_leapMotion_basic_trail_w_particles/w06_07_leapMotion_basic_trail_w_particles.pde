// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 18 2016


float pfingerX, pfingerY;
float fingerX, fingerY;

ArrayList<Circle> circles = new ArrayList<Circle>();


void setup() {
  size(800, 500);
  background(0);
  noStroke();
  
  LeapMotion_setup();
}


void draw() {
  background(0);

  LeapMotion_run();

  // add circles
  circles.add( new Circle( fingerX, fingerY, 20) );

  // update & draw circles
  for (int i=0; i<circles.size(); i++) {
    circles.get(i).update();
    circles.get(i).display();
  }
  // limit the number of circle and remove the oldest circles
  if (circles.size() > 200) {
    circles.remove(0);
  }

  text(circles.size(), 10, 20);

  pfingerX = fingerX;
  pfingerY = fingerY;
}

class Circle {
  float x, y;
  float size;
  color clr;
  int alpha;

  Circle(float _x, float _y, float _size) {
    x = _x;
    y = _y;
    size = _size;
    clr = color(255);
    alpha = 255;
  }

  void update() {
    alpha-=5;
  }
  
  void display() {
    pushStyle();
    fill(clr, alpha);
    ellipse(x, y, size, size);
    popStyle();
  }
}