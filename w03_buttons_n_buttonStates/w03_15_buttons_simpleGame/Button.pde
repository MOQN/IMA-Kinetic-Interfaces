class Button {
  float posX, posY;
  float velX, velY;
  float size;
  float r, g, b; // color

  int state = 0;
  /** 
   state
   0: not pressed
   1: on hover
   2: triggered
   3: on press
   4: released
   **/
  boolean prevPress = false;

  SoundFile sound;


  Button(float x, float y, SoundFile snd) {
    posX = x;
    posY = y;
    velX = random(-1.5, 1.5);
    velY = random(-2.0, -0.5);

    size = random(5, 50); 

    r = random(255);
    g = random(255);
    b = random(255);

    sound = snd;
  }


  void update() {
    posX = posX + velX;
    posY = posY + velY;

    checkState();
  }
  void checkState() {
    boolean currPress = false;
    float distance = dist(posX, posY, mouseX, mouseY);
    if ( distance < size/2 ) { // radious
      if (mousePressed) {
        currPress = true;
        //if (!prevPress) {
        if (prevPress == false &&  currPress == true) {
          state = 2;
          //println("just pressed");
        } else {
          state = 3;
          //println("on press");
        }
      } else {
        currPress = false;
        //if (prevPress) {
        if (prevPress == true &&  currPress == false) {
          state = 4;
          //println("released");
        } else {
          state = 1;
          //println("hovering");
        }
      }
    } else {
      state = 0;
    }
    //println(prevPress + "  |  " + currPress);
    prevPress = currPress;
  }
  void display() {
    pushStyle();

    switch (state) {
    case 0:
      stroke(r, g, b);
      fill(r, g, b, 100);
      ellipse(posX, posY, size, size);
      break;
    case 1: // hover
      stroke(r, g, b);
      fill(r, g, b);
      ellipse(posX, posY, size, size);
      break;
    case 2: // triggered
      stroke(r, g, b);
      fill(r, g, b, 200);
      ellipse(posX, posY, size * 2.0, size * 2.0);
      sound.play(); // ***sound.play(); // ***
      break;
    case 3: // on press
      stroke(r, g, b);
      fill(r, g, b, 50);
      ellipse(posX, posY, size * 0.7, size * 0.7);
      break;
    case 4: // released
      stroke(r, g, b);
      fill(r, g, b, 50);
      ellipse(posX, posY, size * 1.4, size * 1.4);
      break;
    }

    popStyle();
  }
}