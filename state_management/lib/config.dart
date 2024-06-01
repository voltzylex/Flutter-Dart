import 'package:flutter/foundation.dart';

void debugLog(String message,{bool error = false}){
  if(!kDebugMode){
    return ;
  }
  if(error){
    printError(message);
  }else{
    printWarning(message);
  }
}
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

enum DebugType { error, info, url, response, statusCode }

prettyPrint(
    {required String tag,
      required dynamic value,
      DebugType type = DebugType.info}) {
  switch (type) {
    case DebugType.statusCode:
      {
        debugPrint('\x1B[33m${"💎 STATUS CODE $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.info:
      {
        debugPrint('\x1B[32m${"⚡ INFO $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.error:
      {
        debugPrint('\x1B[31m${"🚨 ERROR $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.response:
      {
        debugPrint('\x1B[36m${"💡 RESPONSE $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.url:
      {
        debugPrint('\x1B[34m${"📌 URL $tag: $value"}\x1B[0m');
        break;
      }
  }
}