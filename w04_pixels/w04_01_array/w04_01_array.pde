// IMA NYU Shanghai
// Interaction Lab + Kinetic Interfaces
// MOQN
// Sep 20 2016

int[] numbers = { 90, 150, 30 };
// int[] numbers = new int[3];

// ArrayList<int> nums = new ArrayList<int>();
// Error? what?? why?
// Look up  IntList, FloatList, StringList

void setup() {
  //num = numbers + 1; // error
  int num = numbers[0] + 1;
}

void draw() {
  println(numbers.length);
}