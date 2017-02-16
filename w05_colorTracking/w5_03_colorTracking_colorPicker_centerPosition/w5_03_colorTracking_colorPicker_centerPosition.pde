// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 27 2016


import processing.video.*;

Capture cam;
PImage img;
color pickedColor;
int tolerance = 20;

void setup() {
  size(640, 360);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("No cameras available.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + ": " + cameras[i]);
    }
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
  img = createImage(640, 360, ARGB); //not RGBA
}


void draw() {
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }

  int sumX = 0;
  int sumY = 0;
  int avgX = 0;
  int avgY = 0;
  int count = 0;

  int w = cam.width;
  int h = cam.height;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      if (r > red(pickedColor)-tolerance && r < red(pickedColor)+tolerance &&
        g > green(pickedColor)-tolerance && g < green(pickedColor)+tolerance &&
        b > blue(pickedColor)-tolerance && b < blue(pickedColor)+tolerance )
      {
        img.pixels[i] = color(255, 0, 0);
        sumX += x;
        sumY += y;
        count++;
      } else { 
        img.pixels[i] = color(0, 0);
      }
    }
  }
  // get average position to get the center position
  if (count != 0) {
    avgX = sumX / count;
    avgY = sumY / count;
  }
  
  img.updatePixels();
  image(cam, 0, 0);
  image(img, 0, 0);

  // draw the picked color
  noStroke();
  fill(pickedColor);
  rect(10, 10, 50, 50);
  
  // show the center position
  stroke(255);
  line(avgX, 0, avgX, height);
  line(0, avgY, width, avgY);
}

void mousePressed() {
  pickedColor = cam.get(mouseX, mouseY);
}