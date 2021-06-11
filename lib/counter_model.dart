import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier
{
  int _count = 60;

  void decrement(){
    _count--;
    notifyListeners();
  }

  int get count => _count;
}