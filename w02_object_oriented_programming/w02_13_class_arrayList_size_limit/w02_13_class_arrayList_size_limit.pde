// IMA | NYU Shanghai
// Kinetic Interfaces
// MOQN
// Jan 31 2018


ArrayList<Ball> balls = new ArrayList<Ball>();


void setup() {
  size(500, 600);
  noStroke();
}


void draw() {
  background(100);

  for (int i=0; i<balls.size(); i++) {
    Ball b = balls.get(i); 
    b.move();
    b.bounce();
    b.display();
  }

  if (mousePressed) {
    balls.add( new Ball(mouseX, mouseY) );
  }
  
  // in this way, you can limit the total number of the balls
  if (balls.size() > 100) {
    // remove the oldest one (the first element of the arrayList)
    balls.remove(0);
  }
  
  // display the number of the balls
  fill(255);
  text(balls.size(), 20, 30);
}