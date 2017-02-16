import controlP5.*;
import java.util.*;
import peasy.*;

PeasyCam cam;
ControlP5 cp5;

boolean guiToggle;
int thresholdMin;
int thresholdMax;
int resolution;
int pointSize;
int y_offset;
float monitorScale;

void setupPeasyCam() {
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void setupGui() {
  guiToggle = true;
  
  int sliderW = 100;
  int sliderH = 15;
  int startX = 10;
  int startY = 35;
  int spacing = 20;

  cp5 = new ControlP5( this );
  cp5.addSlider("thresholdMin")
    .setPosition(startX, startY+spacing*0)
    .setSize(sliderW, sliderH)
    .setRange(0, 4499)
    .setValue(1664)
    ;    
  cp5.addSlider("thresholdMax")
    .setPosition(startX, startY+spacing*1)
    .setSize(sliderW, sliderH)
    .setRange(0, 4499)
    .setValue(3239)
    ;
  cp5.addSlider("resolution")
    .setPosition(startX, startY+spacing*2)
    .setSize(sliderW, sliderH)
    .setRange(1, 10)
    .setValue(3)
    ;
  cp5.addSlider("pointSize")
    .setPosition(startX, startY+spacing*3)
    .setSize(sliderW, sliderH)
    .setRange(1, 5)
    .setValue(2)
    ;
  cp5.addSlider("y_offset")
    .setPosition(startX, startY+spacing*4)
    .setSize(sliderW, sliderH)
    .setRange(-1000, 1000)
    .setValue(0)
    ;
  cp5.addSlider("monitorScale")
    .setPosition(startX, startY+spacing*5)
    .setSize(sliderW, sliderH)
    .setRange(0.1, 1.0)
    .setValue(0.5)
    ;
  cp5.setAutoDraw(false);
}

void drawGui() {

  if (mouseX < 150) cam.setActive(false);
  else  cam.setActive(true);

  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();

  pushStyle();
  fill(255);
  cp5.draw();
  text(frameRate, 10, 20);
  drawDepthImage();
  popStyle();

  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void drawDepthImage() {
  pushStyle();
  pushMatrix();
  translate(width, 0);
  scale(monitorScale);
  image(kinect2.getDepthImage(), -kinect2.depthWidth, 0, kinect2.depthWidth, kinect2.depthHeight);
  image(depthImg, -kinect2.depthWidth, 0, kinect2.depthWidth, kinect2.depthHeight);
  pushStyle();
  popMatrix();
}