import 'package:flutter/material.dart';
import '/pages/home.dart';
import 'pages/denominationPage.dart';
import 'pages/summaryPage.dart';
import 'class/players.dart';

List<Players> playersList = [
  // Players("John", 0),
  // Players("Doe", 0),
  // Players("Lily", 0),
  // Players("Emily", 0),
  // Players("Michael", 0),
  // Players("Sophia", 0),
  // Players("David"),
  // Players("Olivia"),
];

void main() {
  // playersList[0].earning = 50;
  // playersList[1].earning = 30;
  // playersList[2].earning = 100;
  // playersList[3].earning = -60;
  // playersList[4].earning = -50;
  // playersList[5].earning = -70;

  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        "/home": (context) => HomePage(playersList),
        "/chipPage": (context) => DenominationPage(playersList),
        "/summaryPage": (context) => SummaryPage(playersList),
      },
    ),
  );
}
