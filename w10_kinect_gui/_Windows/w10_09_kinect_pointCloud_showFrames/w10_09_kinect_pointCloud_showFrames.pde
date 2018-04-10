// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 3 2018


import controlP5.*;


ArrayList<PImage> frames = new ArrayList<PImage>();
int frameIndex = 0;
int resolution = 3;

ControlP5 cp5;


void setup() {
  size(1000, 500, P3D);

  String path = sketchPath("data/png");  
  println(path);
  File file = new File( path );
  if (file.isDirectory()) {
    String filenames[] = sort( file.list() );
    printArray(filenames);
    for (int i=0; i<filenames.length; i++) {
      PImage img = loadImage( "data/png/" + filenames[i] );
      if (img != null) {
        frames.add( img );
      }
    }
  }

  cp5 = new ControlP5(this);
  cp5.addSlider("frameIndex")
    .setPosition(10, height - 30)
    .setSize(width-70, 20)
    .setRange(0, frames.size()-1)
    ;
}


void draw() {
  background(0);

  PImage depthImg = frames.get(frameIndex);
  image(depthImg, 0, 0, depthImg.width * 0.5, depthImg.height * 0.5);

  // 3D Space
  pushMatrix();
  translate(width/2, height/2);
  rotateY(frameCount * 0.01);

  stroke(255);
  strokeWeight(2);

  depthImg.loadPixels();
  for (int y = 0; y < depthImg.height; y += resolution) {
    for (int x = 0; x < depthImg.width; x += resolution) {
      int i = x + y * depthImg.width;
      float depth = red(depthImg.pixels[i]);

      if (depth != 0) {
        float px, py, pz;
        px = map(x, 0, depthImg.width, -depthImg.width/2, depthImg.width/2);
        py = map(y, 0, depthImg.height, -depthImg.height/2, depthImg.height/2);
        pz = map(depth, 0, 255, 500, -500);

        point(px, py, pz);
      }
    }
  }
  popMatrix();

  // 2D again
  fill(255);
  text(frameRate, 10, 20);
}
