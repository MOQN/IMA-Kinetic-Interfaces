// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 20 2016

void setup() {
  size(500, 600);
  noStroke();

  int count = 0;
  int gridSize = 50;
  
  // think about why we do Y for-loop first!
  for (int y=0; y<height; y+=gridSize) {
    for (int x=0; x<width; x+=gridSize) {
      
      fill(random(255), random(255), random(255));
      rect(x, y, gridSize, gridSize);
      fill(255);
      
      text(count, x+10,y+20);
      count++;
    }
  }
}

void draw() {
  //
}