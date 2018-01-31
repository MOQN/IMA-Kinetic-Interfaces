// you can organize your code better by using the tabs!

class Ball {
  float x, y, size;
  color clr;
  float xspeed, yspeed;
  boolean isDone;
  
  float lifespan = 1.0; //100%
  float lifeReduction = random(0.010, 0.001);

  Ball(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    size = random(10, 100);
    clr = color(random(255), random(255), random(255));

    xspeed = random(-2, 2);
    yspeed = random(-2, 2);

    isDone = false;
  }

  void display() {
    fill(clr);
    ellipse(x, y, size * lifespan, size * lifespan); // we change the size based on the lifespan :D
  }
  void move() {
    x += xspeed;
    y += yspeed;
  }
  void bounce() {
    if (x < 0) {
      xspeed = -xspeed;
    } else if (x > width) {
      xspeed = -xspeed;
    }
    if (y < 0) {
      yspeed = -yspeed;
    } else if (y > height) {
      yspeed = -yspeed;
    }
  }
  void checkOutOfCanvas() {
    if (x < 0 || x > width) {
      isDone = true;
    }
    if (y < 0 || y > height) {
      isDone = true;
    }
  }
  
  // ***
  void updateLifespan() {
    lifespan -= lifeReduction;
    lifespan = constrain(lifespan, 0.0, 1.0);
    
    if (lifespan <= 0.0) {
      isDone = true;
    }
  }
  
}