// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 20 2016

PImage img;
void setup() {
  size(500,500);
  img = loadImage("colorful.jpg");
}

void draw() { 
  image(img,0,0);
}

void mousePressed() {
  // Let's make a colorPicker :D
  //print x and y coordinates of mousePress
  println(mouseX + ", " + mouseY);
  //img.get returns color value of the coordinates as color object
  //look at this link for more info on color object - https://processing.org/reference/color_.html
  color c = img.get(mouseX, mouseY);
  //red(c), green(c) and blue(c) returns R, G, B values respectively of color object c
  println(red(c) + ", " + green(c) + ", " + blue(c));
  println();
}