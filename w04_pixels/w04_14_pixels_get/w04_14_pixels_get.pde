// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Feb 12 2016


PImage img;
color c;


void setup() {
  size(500,500);
  background(0);
  
  img = loadImage("colorful.jpg");
}


void draw() {
  image(img,0,0);
  
  fill(c);
  rect(10, 10, 50, 50);
}


void mousePressed() {
  // Let's make a colorPicker :D
  //print x and y coordinates of mousePress
  println(mouseX + ", " + mouseY);
  
  c = img.get(mouseX, mouseY);
  println(red(c) + ", " + green(c) + ", " + blue(c));
  println();
}