import 'package:flutter/material.dart';
import '../model/counter_model.dart';

class CounterProvider extends ChangeNotifier {
  final Counter _counter = Counter(0);

  Counter get counter => _counter;

  void increment() {
    _counter.value++;
    notifyListeners();
  }
}
