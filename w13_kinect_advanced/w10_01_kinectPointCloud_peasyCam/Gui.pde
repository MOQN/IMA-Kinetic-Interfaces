import controlP5.*;
import java.util.*;

ControlP5 cp5;

void setupGui() {
  int sliderW = 100;
  int sliderH = 15;
  int sliderSpacing = 20;

  cp5 = new ControlP5( this );
  cp5.addSlider("thresholdMin")
    .setPosition(10, 40 + sliderSpacing*0)
    .setSize(sliderW, sliderH)
    .setRange(0, 4499)
    .setValue(0)
    ;
  cp5.addSlider("thresholdMax")
    .setPosition(10, 40 + sliderSpacing*1)
    .setSize(sliderW, sliderH)
    .setRange(0, 4499)
    .setValue(4499)
    ;
  cp5.addSlider("resolution")
    .setPosition(10, 40 + sliderSpacing*2)
    .setSize(sliderW, sliderH)
    .setRange(1, 10)
    .setValue(3)
    ;
  cp5.setAutoDraw(false);
}


void drawGui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  fill(255);
  text(frameRate, 10, 20);
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}