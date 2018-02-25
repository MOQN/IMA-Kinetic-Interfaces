// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 26 2018


int[] numbers = { 5, 7, 9, 2, 3, 8, 10, 4, 1, 6, 17, 21, 50, 33, 0, 46, 14 }; 


void setup() {
  size(640, 480);
  
  int max = 0;
  for (int i = 0; i < numbers.length;  i++) {
    if (max < numbers[i]) {
      max = numbers[i];
      println(max);
    }
  }
  println("Result: " + max);
  
  noLoop();
}