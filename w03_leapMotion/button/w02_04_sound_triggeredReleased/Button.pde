class Button {
  float x, y;
  float size;
  color clr;
  int state = 0;
  boolean prevState;

  Button() {
    x = 200;
    y = 200;
    size = 100;
    clr = color(255);
    prevState = false;
  }
  void display() {
    pushStyle();
    noStroke();
    fill(clr);
    ellipse(x, y, size, size);
    popStyle();
  }
  int checkDistance() {
    state = 0;
    boolean currState = false;
    
    float distance = dist(x, y, mouseX, mouseY);
    if (distance < size/2) {
      clr = color(random(255), random(255), random(255));
      currState = true;
    } else {
      //clr = color(255, 0, 0);
      currState = false;
    }
    println(prevState + "  |  " + currState);
    
    if (!prevState && currState) {
      clr = color(random(255), random(255), random(255));
      println("______________ Just Triggered");
      state = 1;
    } else if (prevState && !currState) {
      x = random(width*0.2,width*0.8);
      y = random(height*0.2,height*0.8);
      size = random(50,150);
      println("______________ Just Released");
      state = 2;
    }
    prevState = currState;
    return state;
  }
}