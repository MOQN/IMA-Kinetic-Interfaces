// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 7 2018

import processing.sound.*;

SoundFile sound;
ArrayList<Button> buttons = new ArrayList<Button>();

color bgColor;

void setup() {
  size(600, 600);
  stroke(255, 0, 0);
  noFill();
  
  bgColor = color(0);
  sound = new SoundFile(this, "sound.wav");

  
  //    buttons.add( new Button(x+pitch/2, y+pitch/2, sound) );
}


void draw() {
  background(bgColor);
  
  buttons.add( new Button(width/2, height, sound) );
  
  int count = 0;
  for (int i=0; i<buttons.size(); i++) {
    Button btn = buttons.get(i);
    btn.update();
    btn.display();
    
    if (btn.state == 2) {
      count++;
    }
  }
  if (count > 1) {
    bgColor = color(random(255),random(255),random(255));
  }
  
  if (buttons.size() > 300) {
    buttons.remove(1);
  }
}