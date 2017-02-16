class Button {
  float x, y;
  float size;
  color clr;
  int state = 0;

  Button() {
    x = 200;
    y = 200;
    size = 100;
    clr = color(255);
  }
  void display() {
    pushStyle();
    noStroke();
    fill(clr);
    ellipse(x, y, size, size);
    popStyle();
  }
  int checkDistance() {
    float distance = dist(x, y, mouseX, mouseY);
    if (distance < size/2) {
      clr = color(random(255), random(255), random(255));
      state = 1;
    } else {
      clr = color(255, 0, 0);
      state = 0;
    }
    return state;
  }
}