import 'package:flutter/material.dart';

class CountController extends ChangeNotifier{
  int count = 0;
  void updateCount(){
    count++;
    notifyListeners();
  }
}