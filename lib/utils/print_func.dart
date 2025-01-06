import 'package:flutter/foundation.dart';

void printScreen(dynamic value) {
  if (kDebugMode) {
    print(value.toString());
  }
}
