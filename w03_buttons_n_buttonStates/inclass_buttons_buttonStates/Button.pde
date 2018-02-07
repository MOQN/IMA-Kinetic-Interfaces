class Button {
  float posX, posY;
  float size;
  float r, g, b; // color
  int state = 0;
  /** 
   state
   0: not pressed
   1: hover
   2: triggered
   3: on press
   4: released
   **/


  Button(float x, float y) {
    posX = x;
    posY = y;

    size = 100;

    r = random(255);
    g = random(255);
    b = random(255);
  }

  void update() {
    checkState();
  }
  void checkState() {
    //
  }
  void display() {
    pushStyle();

    switch (state) {
    case 0:
      stroke(r, g, b);
      fill(r, g, b, 150);
      ellipse(posX, posY, size, size);
      break;
    case 1: // hover
      stroke(r, g, b);
      fill(r, g, b, 150);
      ellipse(posX, posY, size, size);
      break;
    case 2: // triggered
      stroke(r, g, b);
      fill(r, g, b, 150);
      ellipse(posX, posY, size, size);
      break;
    case 3: // on press
      stroke(r, g, b);
      fill(r, g, b, 150);
      ellipse(posX, posY, size, size);
      break;
    case 4: // released
      stroke(r, g, b);
      fill(r, g, b, 150);
      ellipse(posX, posY, size, size);
      break;
    }

    popStyle();
  }
}