class Particle {
  float x,y,z;
  float xSpeed;
  float ySpeed;
  float alpha;
  float alphaSpeed;
  
  Particle(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    alpha = 255;
    alphaSpeed = random(3,10);
    xSpeed = random(0.02,0.07);
    ySpeed = random(0.2,0.7);
  }
  
  void run() {
    if (alpha > 0) {
      alpha -= alphaSpeed;
    } else {
      alpha = 0;
    }
    x = x + sin(frameCount*xSpeed) * 0.3;
    y += ySpeed;
    
    pushStyle();
    strokeWeight(3);
    stroke(255,alpha);
    point(x,y,z);
    popStyle();
  }
}