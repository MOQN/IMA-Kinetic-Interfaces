// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;

Capture cam;
PImage img;

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
  img = createImage(640, 360, RGB); //ARGB  //not RGBA
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT
      
      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      
      // enjoy adjusting this!
      //if the r value is less than 100, make r value 0
      if (r < 100) r = 0;
      //if r value is greater than 100
      //randomly calculate r value to range between 50 to 150
      else r = r + int(random(-50,50));
      
      //displays only shades or red or black
      img.pixels[i] = color(r,0,0);
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}