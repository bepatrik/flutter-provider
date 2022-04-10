import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int count = 0;

  int get counter => count;

  increment() {
    count++;
    notifyListeners();
  }

  decrement() {
    count--;
    notifyListeners();
  }

  reset() {
    count = 0;
    notifyListeners();
  }
}
