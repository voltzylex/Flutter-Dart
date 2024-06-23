/*
* * *
* * *
* * *
*/

void nForest(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      print("* ");
    }
    print('\n');
  }
}

void main() {
  // Example usage
  int n = 5; // You can change this value to test with different inputs
  nForest(n);
}
