class Button {
  float posX = width/2;
  float posY = height/2;
  float size = 100;
  color clr = color(255,100);
  int state = 0;
  boolean prevPress = false;
  SoundFile sound;
  /** 
   state
   0: not pressed
   1: hover
   2: triggered
   3: on press
   4: released
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
      noStroke();
      fill(clr);
      ellipse(posX, posY, size, size);
      break;
    case 1: // hover
      noFill();
      stroke(clr);
      ellipse(posX, posY, size * 1.1, size * 1.1);
      break;
    case 2: // triggered
      noStroke();
      clr = color(random(255), random(255), random(255));
      fill(clr);
      ellipse(posX, posY, size * 2.0, size * 2.0);
      
      sound.play(); // ***
      
      break;
    case 3: // on press
      noStroke();
      fill(clr);
      ellipse(posX, posY, size * 0.9, size * 0.9);
      break;
    case 4: // released
      // do nothing
      break;
    }

    popStyle();
  }
}