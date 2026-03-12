import 'package:flutter/foundation.dart';
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
            player.total.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        Container(
          width: screenWidth / 3,
          height: screenHeight * cardHeight,
          alignment: Alignment.center,
          child: Text(
            player.earning.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
