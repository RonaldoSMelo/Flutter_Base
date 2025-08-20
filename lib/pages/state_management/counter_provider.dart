import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int _maxCount = 100;
  int _minCount = -50;

  // Getters
  int get count => _count;
  int get maxCount => _maxCount;
  int get minCount => _minCount;
  bool get isAtMax => _count >= _maxCount;
  bool get isAtMin => _count <= _minCount;

  // Métodos para modificar o estado
  void increment() {
    if (_count < _maxCount) {
      _count++;
      notifyListeners(); // Notifica os widgets que estão escutando
    }
  }

  void decrement() {
    if (_count > _minCount) {
      _count--;
      notifyListeners();
    }
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void setCount(int value) {
    if (value >= _minCount && value <= _maxCount) {
      _count = value;
      notifyListeners();
    }
  }

  void setMaxCount(int max) {
    if (max > _minCount) {
      _maxCount = max;
      if (_count > _maxCount) {
        _count = _maxCount;
      }
      notifyListeners();
    }
  }

  void setMinCount(int min) {
    if (min < _maxCount) {
      _minCount = min;
      if (_count < _minCount) {
        _count = _minCount;
      }
      notifyListeners();
    }
  }
}
