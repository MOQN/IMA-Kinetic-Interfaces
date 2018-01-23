float handX = 0;
float handY = 0;


void setup() {
  size(1920, 1080, P3D);
  setupKinect();
}

void draw() {
  background(0);
  updateKinect();
  
  fill(255,0,0);
  ellipse(handX, handY, 100, 100);
}