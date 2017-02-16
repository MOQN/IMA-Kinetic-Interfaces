class Button {
  float x, y;
  float size;
  color clr;
  boolean prevState;

  Button() {
    x = 200;
    y = 200;
    size = 100;
    clr = color(255);
    prevState = false;
  }
  void update() {
    checkDistance();
  }
  void display() {
    pushStyle();
    noStroke();
    fill(clr);
    ellipse(x, y, size, size);
    popStyle();
  }
  void checkDistance() {
    boolean currState = false;
    float distance = dist(x, y, mouseX, mouseY);
    if (distance < size/2) {
      clr = color(random(255), random(255), random(255));
      currState = true;
    } else {
      clr = color(255, 0, 0);
      currState = false;
    }
    println(prevState + "  |  " + currState);
    prevState = currState;
  }
}