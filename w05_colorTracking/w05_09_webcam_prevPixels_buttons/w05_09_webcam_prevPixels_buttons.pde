// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 28 2016


import processing.video.*;

Capture cam;
PImage prevCam;
PImage img;

Button btn;


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
  prevCam = createImage(640, 360, RGB);
  img = createImage(640, 360, RGB);

  btn = new Button(100, height/2, 100);
}


void draw() {
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }

  prevCam.loadPixels();
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      int prevR = int( red(prevCam.pixels[i]) );
      int prevG = int( green(prevCam.pixels[i]) );
      int prevB = int( blue(prevCam.pixels[i]) );

      int diffR = abs(r-prevR);
      int diffG = abs(g-prevG);
      int diffB = abs(b-prevB);

      img.pixels[i] = color(diffR*5, diffG*5, diffB*5);

      prevCam.pixels[i] = color(r, g, b); // *** Check this out!

      // 30 to stablize
      if (diffR+diffG+diffB > 30) btn.checkDistance(x, y);
    }
  }
  prevCam.updatePixels();
  img.updatePixels();

  image(img, 0, 0);

  btn.update();
  btn.display();
}


class Button {
  float x, y;
  float size;
  int hitCount;
  boolean buttonState = false;

  Button(float _x, float _y, float _size) {
    x = _x;
    y = _y;
    size = _size;
  }
  void checkDistance(float otherX, float otherY) {
    float d = dist(x, y, otherX, otherY);
    if (d < size/2) hitCount++;
  }
  void update() {
    if (hitCount != 0) {
      pushStyle();
      fill(255, 0, 0);
      text(hitCount, x+size*0.4, y-size*0.4);
      popStyle();
    }

    // 1000 - threshold of triggering
    if (hitCount > 1000) {
      buttonState = true;
    } else {
      buttonState = false;
    }
    hitCount = 0;
  }
  void display() {
    pushStyle();
    if (buttonState) {
      fill(255, 0, 0);
      noStroke();
    } else {
      noFill();
      stroke(255, 0, 0);
    }
    ellipse(x, y, size, size);
    popStyle();
  }
}