// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 5 2018

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

  int pitch = 100;
  for (int y=0; y<height; y+=pitch) {
    for (int x=0; x<width; x+=pitch) {
      buttons.add( new Button(x+pitch/2, y+pitch/2, sound) );
    }
  }
}


void draw() {
  background(bgColor);
  
  int count = 0;
  for (int i=0; i<buttons.size(); i++) {
    Button btn = buttons.get(i);
    btn.update();
    btn.display();
    
    if (btn.state == 2) {
      count++;
    }
  }
  
  println(count);
  
  if (count > 1) {
    bgColor = color(random(255),random(255),random(255));
  }
}