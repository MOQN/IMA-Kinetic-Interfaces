// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 5 2018

import processing.sound.*;

SoundFile sound;
Button btn1;
Button btn2;

void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  noFill();

  sound = new SoundFile(this, "sound.wav");
  btn1 = new Button(width/2 - 100, height/2, sound);
  btn2 = new Button(width/2 + 100, height/2, sound);
}


void draw() {
  background(100);

  btn1.update();
  btn1.display();
  
  btn2.update();
  btn2.display();
}