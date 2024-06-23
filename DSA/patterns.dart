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

/*
* 
* *
* * *
*/
void nForest(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j <=i; j++) {
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

/*
1
12
123
*/
public class Solution {
    public static void nTriangle(int n) {
        // Write your code here
        for(int i =0;i<n;i++){
            for(int j = 0;j<=i;j++){
                System.out.print(j+1+" " );
            }
            System.out.println();
        }
    }
}

/*
1
2 2 
3 3 3
*/
public class Solution {
    public static void nTriangle(int n) {
        // Write your code here
        for(int i =0;i<n;i++){
            for(int j = 0;j<=i;j++){
                System.out.print(i+1+" " );
            }
            System.out.println();
        }
    }
}