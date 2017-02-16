// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 8 2016


import processing.sound.*;


Button btn = new Button();
SoundFile sound1;
SoundFile sound2;
color bgColor = color(50);


void setup() {
  size(500, 500);
  sound1 = new SoundFile(this, "bell.wav");
  sound2 = new SoundFile(this, "sound.wav");
}


void draw() {
  background(bgColor);
  
  int btnState = btn.checkDistance();
  switch(btnState) {
  case 0:
    break;
  case 1:
    sound1.play();
    break;
  case 2:
    bgColor = color(random(255), random(255), random(255));
    sound2.play();
    break;
  }
  btn.display();
}