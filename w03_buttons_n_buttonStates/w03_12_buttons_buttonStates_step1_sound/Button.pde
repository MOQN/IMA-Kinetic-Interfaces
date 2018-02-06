class Button {
  float posX = width/2;
  float posY = height/2;
  float size = 100;
  color clr = color(255);
  int state = 0;
  boolean prevPress = false;
  SoundFile sound;
  /** 
   state
   0: not pressed
   1: hover
   2: on press
   **/

  Button(float x, float y, SoundFile snd) {
    posX = x;
    posY = y;
    sound = snd;
  }

  void update() {
    size = sin(frameCount*0.02)*40 + 100;
    checkState();
  }
  void checkState() {
    boolean currPress = false;
    float distance = dist(posX, posY, mouseX, mouseY);
    if ( distance < size/2) { // radious
      if (mousePressed) {
        currPress = true;
        state = 2;
      } else {
        currPress = false;
        state = 1;
      }
    } else {
      state = 0;
    }
    println(prevPress + "  |  " + currPress);
    prevPress = currPress;
  }
  void display() {
    pushStyle();

    switch (state) {
    case 0:
      stroke(clr);
      ellipse(posX, posY, size, size);
      break;
    case 1: // hover
      noStroke();
      fill(clr);
      ellipse(posX, posY, size * 1.1, size * 1.1);
      break;
    case 2: // on press
      noStroke();
      clr = color(random(255), random(255), random(255));
      fill(clr);
      ellipse(posX, posY, size * 1.4, size * 1.4);

      sound.play(); // ***
      
      break;
    }

    popStyle();
  }
}