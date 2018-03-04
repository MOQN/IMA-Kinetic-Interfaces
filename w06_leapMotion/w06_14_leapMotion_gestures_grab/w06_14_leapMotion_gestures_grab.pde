// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Mar 5 2018


import de.voidplus.leapmotion.*;

LeapMotion leap;


void setup() {
  size(800, 500, P3D);
  background(255);

  leap = new LeapMotion(this);
}


void draw() {
  background(255);

  for (Hand hand : leap.getHands()) {

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();


    hand.draw();


    noStroke();
    if (handIsLeft) {
      fill(255, 255, 0, 100); // yellow
    } else if (handIsRight) {
      fill(255, 0, 0, 100); // red
    }

    ellipse(handPosition.x, handPosition.y, 200 * handGrab, 200 * handGrab);

    fill(0);
    text(handGrab, 10, 20);
  }
}