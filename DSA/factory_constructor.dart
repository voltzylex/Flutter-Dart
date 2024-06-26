class Singleton {
  // Private constructor
  Singleton._();

  // The single instance of the class
  static final Singleton _instance = Singleton._();

  // Factory constructor
  factory Singleton() {
    return _instance;
  }
  int i = 0;
  increment() => i++;
  // A sample method to demonstrate functionality
  void doSomething() {
    print('Singleton instance method called');
  }
}

void main() {
  // Creating two variables pointing to Singleton instance
  var s1 = Singleton();
  var s2 = Singleton();

  // Checking if both variables point to the same instance
  print(s1 == s2); // Output: true

  // Using the singleton instance
  s1.doSomething(); // Output: Singleton instance method called
  //  print the index
  print("S1 : ${s1.i}");
//   increment the index
  s1.increment();
//   print the s2 index
  print("S2 : ${s2.i}");
}
