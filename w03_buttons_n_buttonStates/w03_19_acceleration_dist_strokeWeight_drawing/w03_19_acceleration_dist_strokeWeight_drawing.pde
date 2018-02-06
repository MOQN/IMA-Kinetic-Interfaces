// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 7 2016

color clr;

void setup() {
  size(500, 500);
  background(255);

  clr = color(random(255), random(255), random(255));
}


void draw() {
  float distance = dist(pmouseX, pmouseY, mouseX, mouseY);

  if (distance > 80) {
    // if the mouse moves fast, we change the color randomly
    clr = color(random(255), random(255), random(255));
    // and may scatter some dots
    for (int i=0; i<distance/10; i++) {
      float circleSize = random(1, 4);
      noStroke();
      fill(clr);
      ellipse(
        mouseX + random(-distance, distance), 
        mouseY + random(-distance, distance), 
        circleSize, circleSize
        );
    }
  }

  float thickness = map(distance, 0, 100, 30, 1);
  thickness = constrain(thickness, 1, 30);
  strokeWeight(thickness);

  stroke(clr);
  line(pmouseX, pmouseY, mouseX, mouseY);
}