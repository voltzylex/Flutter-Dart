// https://takeuforward.org/strivers-a2z-dsa-course/must-do-pattern-problems-before-starting-dsa/

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
/*
****
***
**
*
*/
public class Solution {
    public static void seeding(int n) {
        // Write your code here
        for(int i = 0;i<n;i++){
            for(int j=n;j>i;j--){
                System.out.print("* ");
            }
            System.out.println();
        }
    }
}
/*
Pattern 6
1 2 3
1 2
1
*/

public class Solution {
    public static void nNumberTriangle(int n) {
        // Write your code here
        for(int i =0;i<n;i++){
            // int k=0;
            for(int j=n;j>i;j--){
                System.out.print(n-j+1+" ");
                
                // System.out.print(k+1+" ");
                // k++;
            }
            System.out.println();
        }
    }
}
/*
  *
 ***
*****
*/
 class Solution {
    patter7(){
        // Write your code here
        for(int i = 0;i<n;i++){
            for(int j = 0;j<n-i-1;j++){
               print(" ");
            }
            for(int j=0;j<2*i+1;j++){
                print("*");
            }
            for(int j = 0;j<n-i-1;j++){
                print(" ");
            }
            print("\n");
        }
       
    }
    
}