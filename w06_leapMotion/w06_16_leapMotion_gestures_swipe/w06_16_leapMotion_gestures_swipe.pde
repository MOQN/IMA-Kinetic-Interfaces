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


// Swipe Gesture
void leapOnSwipeGesture(SwipeGesture g, int state) {
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector positionStart    = g.getStartPosition();
  PVector direction        = g.getDirection();
  float   speed            = g.getSpeed();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: // Stop
    println("SwipeGesture: " + id);
    println("directionX: " + direction.x);
    println("directionY: " + direction.y);
    break;
  }
}