// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:flutter/foundation.dart';

void debugLog(String message, {bool error = false, bool isLog = true}) {
  if (!kDebugMode) {
    return;
  }
  if (isLog) {
    log(message, name: "Debug");
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
