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

  cp5.addButton("reset_GUI") // should be matched with the function name. check the function below!
    .setPosition(guiX, guiY + sliderSpacing * 1)
    .setSize(sliderW, sliderH)
    ;
  cp5.addToggle("show_depthImage") // should be matched with the variable name.
    .setPosition(guiX, guiY + sliderSpacing * 2)
    .setSize(sliderW, sliderH)
    .setValue(true)
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


void reset_GUI() {
  
  // this function will be triggered by the button controller
  // Again the name of this function should be the same as the string of the button controller.
  
  depthRange.setRangeValues(1, 4499);
  rotation.setValue(0,0);
  posOffset.setValue(0,0);
  
}
