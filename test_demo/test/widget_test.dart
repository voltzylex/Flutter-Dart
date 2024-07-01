import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deeplinking/main.dart';

void main() {
  test(
    "Check Increment",
    () {
      final t = MainTest();
      t.value = 0;
      t.increment();
      expect(t.value, 1);
    },
  );
  test(
    "Checking Decrement",
    () {
      final t = MainTest();
      t.decrement();
      expect(t.value, -1);
    },
  );
}
