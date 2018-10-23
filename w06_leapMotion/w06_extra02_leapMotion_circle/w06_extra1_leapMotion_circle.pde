import de.voidplus.leapmotion.*;

LeapMotion leap;
float angle;


void setup() {
  size(500, 600);
  background(100);
  leap = new LeapMotion(this).allowGestures( "circle" );
}


void draw() {
  background(100);

  pushMatrix();
  translate(width/2, height/2);
  rotate( radians(angle) * 2.0 );
  rectMode(CENTER);
  noStroke();
  fill(255, 0, 0);
  rect(0, 0, 300, 300);
  popMatrix();
}


void leapOnCircleGesture(CircleGesture g, int state) {
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector positionCenter   = g.getCenter();
  float   radius           = g.getRadius();
  float   progress         = g.getProgress();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();
  int     direction        = g.getDirection();

  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: // Stop
    println("CircleGesture: " + id);
    break;
  }

  switch(direction) {
  case 0: // Anticlockwise/Left gesture
    println("Anticlockwise");
    angle--; // ***
    break;
  case 1: // Clockwise/Right gesture
    println("Clockwise");
    angle++; // ***
    break;
  }
}
