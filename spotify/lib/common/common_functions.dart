import 'package:flutter/foundation.dart';

// void debugLog(String message, {String name = ""}) {
//   log(message, name: name);
// }
void debugLog(String message, {bool error = false}) {
  if (!kDebugMode) {
    return;
  }
  if (error) {
    printError(message);
  } else {
    printWarning(message);
  }
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}
