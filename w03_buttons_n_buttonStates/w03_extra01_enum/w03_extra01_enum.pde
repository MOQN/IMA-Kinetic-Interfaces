// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 12 2016

//  Enumeration

enum ButtonState {
  NONE, ON_HOVER, TRIGGERED, ON_PRESS, RELEASED
}

ButtonState btnState;

void setup() {
  size(500, 600);
  
  btnState = ButtonState.ON_HOVER;
  
  switch (btnState) {
  case NONE:
    println("1");
    break;
  case ON_HOVER:
    println("2");
    break;
  case TRIGGERED:
    println("3");
    break;
  case ON_PRESS:
    println("4");
    break;
  case RELEASED:
    println("5");
    break;
  }
}

void draw() {
  //
}