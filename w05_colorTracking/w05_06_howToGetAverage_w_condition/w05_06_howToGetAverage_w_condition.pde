// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Feb 26 2018


int[] numbers = { 5, 7, 9, 2, 3, 8, 10, 4, 1, 6, 17, 21, 50, 33, 0, 46, 14 }; 


void setup() {
  size(640, 480);

  int sum = 0;
  int count = 0;
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] >= 10 && numbers[i] <= 30) {
      sum += numbers[i];
      count++;
    }
  }
  println("Sum: " + sum);

  float avg = 0;
  if (count > 0) { 
    avg = sum / count;
  }
  println("Avg: " + avg);

  noLoop();
}