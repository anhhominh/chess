import 'package:flutter/material.dart';

class CheckController extends ChangeNotifier{
  bool? check;
  int index = 0;

  void updateCheck(bool value){
    check = value;
    notifyListeners();
  }

  void updateIndex(){
    index++;
    notifyListeners();
  }

}