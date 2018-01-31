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
    //b.bounce(); // We don't use this function.
    b.updateLifespan();
    b.checkOutOfCanvas();
    b.display();
  }

  if (mousePressed) {
    balls.add( new Ball(mouseX, mouseY) );
  }
  
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (b.isDone) {
      // if the ball is out of canvas, remove it with the index of the elements
      balls.remove(i);
    }
  }
  
  // display the number of the balls
  fill(255);
  text(balls.size(), 20, 30);
}