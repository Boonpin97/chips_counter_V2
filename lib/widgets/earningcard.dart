import 'package:flutter/material.dart';
import '/class/players.dart';

const double cardHeight = 0.04;

class EarningCard extends StatelessWidget {
  Players player;
  EarningCard(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final earningColor = player.earning > 0.005
        ? Colors.green
        : player.earning < -0.005
            ? Colors.red
            : Colors.black;
    return Row(
      children: [
        Container(
          width: screenWidth / 3,
          height: screenHeight * cardHeight,
          alignment: Alignment.center,
          child: Text(
            player.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        Container(
          width: screenWidth / 3,
          height: screenHeight * cardHeight,
          alignment: Alignment.center,
          child: Text(
            player.total.toStringAsFixed(2),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        Container(
          width: screenWidth / 3,
          height: screenHeight * cardHeight,
          alignment: Alignment.center,
          child: Text(
            player.earning.toStringAsFixed(2),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: earningColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
