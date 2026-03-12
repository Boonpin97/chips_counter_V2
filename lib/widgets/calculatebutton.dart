import 'package:flutter/material.dart';
import 'package:chip_counter/class/players.dart';
import '/params.dart';

const double buttonWidth = 0.8;

class CalculateButton extends StatelessWidget {
  List<Players> playerlist;
  double base;
  CalculateButton(this.playerlist, this.base, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * buttonWidth,
      child: ElevatedButton(
        onPressed: () {
          for (Players player in playerlist) {
            player.base = playerbase;
            player.updateValues();
          }
          Navigator.pushNamed(
            context,
            '/summaryPage',
            //arguments: ScreenArguments(index),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF10E99A),
        ),
        child: const Text(
          'Calculate',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
