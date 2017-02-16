// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 20 2016

void setup() {
  size(500, 500);
  noStroke();

  int seq = 0;
  int gridSize = 50;
  
  // think about why we do Y for-loop first!
  //increment by gridSize to make a grid of gridSize by gridSize
  for (int y=0; y<height; y+=gridSize) {
    for (int x=0; x<width; x+=gridSize) {
      fill(random(255), random(255), random(255));
      rect(x, y, gridSize, gridSize);
      fill(255);
      //display sequence number to show in what order rect is being drawn
      text(seq, x+10,y+20);
      //increment seq by 1
      seq++;
    }
  }
}

void draw() {
  // :P
}