import 'package:chip_counter/widgets/earningcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/widgets/playercard.dart';
import '/class/players.dart';
import '/widgets/earningcard.dart';

const whiteAreaWidth = 0.8;
const whiteAreaHeight = 0.6;
const titleHeight = 0.05;

class PlayerEarning extends StatelessWidget {
  List<Players> playersList;

  PlayerEarning(this.playersList);

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * titleHeight,
            child: const Text(
              'Results',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          Row(
            children: [
              Container(
                width: screenWidth / 3,
                height: screenHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Players',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                width: screenWidth / 3,
                height: screenHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Total',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                width: screenWidth / 3,
                height: screenHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Earnings',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth,
            height: screenHeight * 0.32,
            child: ListView.builder(
              itemCount: playersList.length,
              itemBuilder: (context, index) {
                return EarningCard(playersList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
