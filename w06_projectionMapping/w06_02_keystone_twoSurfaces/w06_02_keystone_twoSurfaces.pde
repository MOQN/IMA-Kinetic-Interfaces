// Based on Keystone Library by David Bouchard
// http://keystonep5.sourceforge.net/

// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Oct 11 2016


import deadpixel.keystone.*;

Keystone ks;

CornerPinSurface s1;
PGraphics p1;

CornerPinSurface s2;
PGraphics p2;


void setup() {
  size(800, 600, P3D);

  ks = new Keystone(this);
  s1 = ks.createCornerPinSurface(400, 300, 20);
  p1 = createGraphics(400, 300, P3D);
  
  s2 = ks.createCornerPinSurface(400, 300, 20);
  p2 = createGraphics(400, 300, P3D);
}


void draw() {
  PVector surfaceMouse1 = s1.getTransformedMouse();
  PVector surfaceMouse2 = s2.getTransformedMouse();

  p1.beginDraw();
  p1.background(255);
  p1.fill(0, 255, 0);
  p1.ellipse(surfaceMouse1.x, surfaceMouse1.y, 75, 75);
  p1.endDraw();
  
  p2.beginDraw();
  p2.background(100);
  p2.fill(255, 0, 0);
  p2.ellipse(surfaceMouse2.x, surfaceMouse2.y, 75, 75);
  p2.endDraw();
  
  background(0);
 
  s1.render(p1);
  s2.render(p2);
}


void keyPressed() {
  switch(key) {
  case 'c':
    ks.toggleCalibration();
    break;

  case 'l':
    ks.load();
    break;

  case 's':
    ks.save();
    break;
  }
}