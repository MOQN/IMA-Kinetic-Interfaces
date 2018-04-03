import controlP5.*;


ControlP5 cp5;


void initGui() {
  int guiX = 10;
  int guiY = 150;
  int sliderW = 100;
  int sliderH = 20;
  int sliderSpacing = sliderH + 10;

  cp5 = new ControlP5( this );

  cp5.addSlider("thresholdMin")
    .setPosition(guiX, guiY + sliderSpacing * 0)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(0)
    ;
  cp5.addSlider("thresholdMax")
    .setPosition(guiX, guiY + sliderSpacing * 1)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(4499)
    ;
  cp5.addSlider("resolution")
    .setPosition(guiX, guiY + sliderSpacing * 2)
    .setSize(sliderW, sliderH)
    .setRange(2, 10)
    .setValue(3)
    .setNumberOfTickMarks(9)
    .setSliderMode(Slider.FLEXIBLE)
    ;
}
