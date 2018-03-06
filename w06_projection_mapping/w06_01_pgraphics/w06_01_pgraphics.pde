// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Mar 7 2018


PGraphics p; 


void setup() {
  size(800, 600);

  p = createGraphics(300, 300);
  //p = createGraphics(400, 300, P2D); // P3D
}


void draw() {
  // draw ellipses in PGraphics buffer (FBO: Frame Buffer Object) 
  p.beginDraw();
    p.background(255,255,0); // yellow
    p.fill(0, 255, 0);
    p.ellipse(random(p.width), random(p.height), 30, 30);
  p.endDraw();

  background(0);
  imageMode(CENTER);
  image(p, mouseX, mouseY);
}