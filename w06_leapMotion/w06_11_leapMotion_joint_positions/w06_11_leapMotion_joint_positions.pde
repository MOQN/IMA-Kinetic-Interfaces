// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Mar 5 2018


Finger fIndex;


void setup() {
  size(800, 500, P3D);
  background(255);
  noStroke();

  LeapMotion_setup();
}


void draw() {
  background(255);

  LeapMotion_run();

  // https://developer.leapmotion.com/documentation/java/devguide/Leap_Overview.html#Layer_1
  
  if (fIndex != null) {
    PVector tip = fIndex.getPositionOfJointTip();
    PVector dip = fIndex.getPositionOfJointDip();
    PVector mcp = fIndex.getPositionOfJointMcp();
    PVector pip = fIndex.getPositionOfJointPip();

    // Metacarpal (red)
    fill(255, 0, 0, 200);
    ellipse(tip.x, tip.y, 10, 10);

    // Intermediate phalanges (blue)
    fill(0, 0, 255, 200);
    ellipse(dip.x, dip.y, 10, 10);

    // Proximal phalanges (green)
    fill(0, 255, 0, 200);
    ellipse(pip.x, pip.y, 10, 10);

    // Metacarpals (yellow)
    fill(255, 255, 0, 200);
    ellipse(mcp.x, mcp.y, 10, 10);
  }
}