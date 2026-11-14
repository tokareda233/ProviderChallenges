import 'package:flutter/material.dart';

class Addpoints extends ChangeNotifier{
int count_A=0;
int count_B=0;

void AddPoints_A(int points){
  count_A+=points;
  notifyListeners();
}
void AddPoints_B(int points){
  count_B+=points;
  notifyListeners();
}
void reset(){
  count_A=0;
  count_B=0;
  notifyListeners();
}
}