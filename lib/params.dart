import 'package:flutter/material.dart';

double playerbase = 0.0;
const List<Color> coinColor = [Colors.redAccent, Colors.green, Colors.blue, Colors.yellow, Colors.orange, Colors.grey];
List<String> denominationList = ['0.1', '0.2', '1', '2', '5', '10'];
//List<String> denominationList = [];

class ScreenArguments {
  final int index;

  ScreenArguments(this.index);
}
