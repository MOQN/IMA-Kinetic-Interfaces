// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 26 2018


int[] numbers = { 5, 7, 9, 2, 3, 8, 10, 4, 1, 6, 17, 21, 50, 33, 0, 46, 14 }; 


void setup() {
  size(640, 480);

  float sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  println("Sum: " + sum);
  
  float avg = sum / numbers.length;
  println("Avg: " + avg);

  noLoop();
}