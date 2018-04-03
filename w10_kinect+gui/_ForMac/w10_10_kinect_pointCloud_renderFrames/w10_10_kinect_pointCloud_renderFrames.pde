// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 3 2018


int numOfParticles = 10000;
int resolution = 5;
int frameIndex = 0;
ArrayList<PImage> frames = new ArrayList<PImage>();
ArrayList<Particle> particles = new ArrayList<Particle>();

boolean render = false; 


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
}


void draw() {
  background(0);


  if (!render) {
    text("Press 'R' to render", 10, 20);
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        render = true;
      }
    }
    return;
  }


  PImage depthImg = frames.get( frameIndex );

  // 3D Space
  pushMatrix();
  translate(width/2, height/2);
  //rotateY(frameCount * 0.003);

  stroke(255);
  strokeWeight(2);

  depthImg.loadPixels();
  for (int y = 0; y < depthImg.height; y += resolution) {
    for (int x = 0; x < depthImg.width; x += resolution) {
      int i = x + y * depthImg.width;
      float depth = red(depthImg.pixels[i]);

      if (depth >= 1
        && depth < 100
        && depth != 0) {
        float px, py, pz;
        px = map(x, 0, depthImg.width, -depthImg.width/2, depthImg.width/2);
        py = map(y, 0, depthImg.height, -depthImg.height/2, depthImg.height/2);
        pz = map(depth, 0, 255, 500, -500);

        //point(px, py, pz);
        particles.add( new Particle(px, py, pz) );
      }
    }
  }
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.move();
    p.display();
  }
  while (particles.size() > numOfParticles ) {
    particles.remove(0);
  }
  popMatrix();


  // saveFrames
  saveFrame("data/render/PNGseq_######.png");
  // 
  frameIndex++;
  if (frameIndex == frames.size()) {
    exit();
  }


  // 2D again
  image(depthImg, 0, 0, depthImg.width * 0.5, depthImg.height * 0.5);
  fill(255);
  text(frameRate, 10, 20);
  text(frameIndex + " / " + (frames.size()-1), 10, 40);
}
