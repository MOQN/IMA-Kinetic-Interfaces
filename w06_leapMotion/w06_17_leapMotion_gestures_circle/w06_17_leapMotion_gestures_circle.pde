// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Mar 5 2018


import de.voidplus.leapmotion.*;

LeapMotion leap;


void setup() {
  size(800, 500, P3D);
  background(255);

  leap = new LeapMotion(this).allowGestures();  // All gestures
  // leap = new LeapMotion(this).allowGestures("circle, swipe, screen_tap, key_tap");
  // leap = new LeapMotion(this).allowGestures("swipe");  // Leap detects only swipe gestures
}


void draw() {
  background(255);

  for (Hand hand : leap.getHands()) {
    hand.draw();
  }
}


// Circle Gesture
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
    println("Anticlockwise!");
    break;
  case 1: // Clockwise/Right gesture
    println("Clockwise!");
    break;
  }
}