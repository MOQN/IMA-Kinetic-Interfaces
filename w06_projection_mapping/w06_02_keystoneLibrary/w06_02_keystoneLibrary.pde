// Based on Keystone Library by David Bouchard
// http://keystonep5.sourceforge.net/

// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Oct 11 2016


import deadpixel.keystone.*;

Keystone ks;
CornerPinSurface surface;

PGraphics quad;


void setup() {
  // Keystone will only work with P3D or OPENGL renderers, 
  // since it relies on texture mapping to deform
  size(800, 600, P3D);
  //fullScreen(P3D);

  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(400, 300, 20);
  
  // We need an offscreen buffer to draw the surface we want projected
  // note that we're matching the resolution of the
  // CornerPinSurface.
  // (The offscreen buffer can be P2D or P3D)
  quad = createGraphics(400, 300, P3D);
}


void draw() {

  // Convert the mouse coordinate into surface coordinates
  // this will allow you to use mouse events inside the surface from your screen. 
  PVector surfaceMouse = surface.getTransformedMouse();

  // Draw the scene, offscreen
  quad.beginDraw();
  quad.background(255);
  quad.fill(0, 255, 0);
  quad.ellipse(surfaceMouse.x, surfaceMouse.y, 75, 75);
  quad.endDraw();

  // most likely, you'll want a black background to minimize
  // bleeding around your projection area
  background(0);
 
  // render the scene, transformed using the corner pin surface
  surface.render(quad);
}


void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}