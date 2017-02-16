// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 20 2016

PImage img;
void setup() {
  size(500, 500);
  img = loadImage("colorful.jpg");
}

void draw() { 
  img.loadPixels();
  //total number of pixels in img = img.width * img.height
  for (int i = 0; i < img.width*img.height; i++) {
    
    // how can we get x,y coordinates from this for-loop?
    
    int r = int( red(img.pixels[i])); 
    int g = int( green(img.pixels[i]));
    int b = int( blue(img.pixels[i]));
    //make the green value of the pixel 0 
    //if the pixel is on the top half of the image 
    if (i < img.width*img.height / 2) {
      img.pixels[i] = color(r, 0, b);
    } 
    //make the blue value of the pixel 0 
    //if the pixel is on the bottom half of the image 
    else {
      img.pixels[i] = color(r, g, 0);
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}