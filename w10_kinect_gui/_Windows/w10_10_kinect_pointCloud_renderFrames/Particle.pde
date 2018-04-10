class Particle {
  PVector pos;
  PVector vel;
  color clr;

  Particle(float x, float y, float z) {
    pos = new PVector(x, y, z);
    vel = new PVector(0, random(1, 2), 0);
    clr = color(140, 20, 15);
  }

  void move() {
    pos.add(vel);
  }

  void display() {
    pushStyle();
    blendMode(ADD);
    strokeWeight( random(2, 5) );
    stroke(clr);
    point(pos.x, pos.y, pos.z);
    popStyle();
  }
}
