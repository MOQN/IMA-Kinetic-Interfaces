import controlP5.*;


ControlP5 cp5;
Slider2D rotation;
Slider2D posOffset;
Range depthRange;


void initGui() {
  int guiX = 10;
  int guiY = 150;
  int sliderW = 100;
  int sliderH = 20;
  int sliderSpacing = sliderH + 10;

  cp5 = new ControlP5( this );
  
  depthRange = cp5.addRange("Depth_Range")
    .setPosition(guiX, guiY + sliderSpacing * 0) 
    .setSize(sliderW * 2, sliderH)
    .setHandleSize(20)
    .setRange(1, 4499)
    .setRangeValues(1, 4499)
    ;
    
  //cp5.addSlider("thresholdMin")
  //  .setPosition(guiX, guiY + sliderSpacing * 0)
  //  .setSize(sliderW, sliderH)
  //  .setRange(1, 4499)
  //  .setValue(0)
  //  ;
  //cp5.addSlider("thresholdMax")
  //  .setPosition(guiX, guiY + sliderSpacing * 1)
  //  .setSize(sliderW, sliderH)
  //  .setRange(1, 4499)
  //  .setValue(4499)
  //  ;
  cp5.addSlider("resolution")
    .setPosition(guiX, guiY + sliderSpacing * 2)
    .setSize(sliderW, sliderH)
    .setRange(2, 10)
    .setValue(3)
    .setNumberOfTickMarks(9)
    .setSliderMode(Slider.FLEXIBLE)
    ;

  rotation = cp5.addSlider2D("Rotation") // this name doesn't matter
    .setPosition(guiX, guiY + sliderSpacing * 3 + 20)
    .setSize(100, 100)
    .setMinMax(-PI, PI, PI, -PI)
    .setValue(0, 0)
    .disableCrosshair()
    ;

  posOffset = cp5.addSlider2D("Pos_Offset") // this name doesn't matter
    .setPosition(guiX, guiY + sliderSpacing * 3 + 140)
    .setSize(100, 100)
    .setMinMax(-200, -200, 200, 200)
    .setValue(0, 0)
    //.disableCrosshair()
    ;
}
