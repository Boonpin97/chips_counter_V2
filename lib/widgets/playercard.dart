import 'package:chip_counter/main.dart';
import 'package:chip_counter/pages/denominationPage.dart';
import 'package:chip_counter/widgets/denomination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/class/players.dart';
import '/params.dart';

const whiteAreaWidth = 0.8;
const whiteAreaHeight = 0.6;
const titleHeight = 0.1;
const buttonWidth = 0.09;
const buttonHeight = 0.06;
const cardHeight = 0.11;
const xbuttonWidth = 0.07;

class PlayerCard extends StatefulWidget {
  @override
  int index;
  List<Players> playersList;
  Function removeHandler;
  PlayerCard(this.index, this.playersList, this.removeHandler, {Key? key});
  State<PlayerCard> createState() =>
      _PlayerCardState(index, playersList, removeHandler);
}

class _PlayerCardState extends State<PlayerCard> {
  int index;
  List<Players> playersList;
  Function removeHandler;
  _PlayerCardState(this.index, this.playersList, this.removeHandler);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * whiteAreaWidth * 0.5,
          height: screenHeight * whiteAreaHeight * cardHeight,
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(
                width: screenWidth * whiteAreaWidth * 0.2,
                child: Container(
                  alignment: Alignment.centerRight,
                  width: screenWidth * whiteAreaWidth * xbuttonWidth,
                  height: screenHeight * whiteAreaHeight * 0.05,
                  child: ElevatedButton(
                    onPressed: () => removeHandler(index),
                    style: ElevatedButton.styleFrom(
                      // styling the button
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(1),
                      backgroundColor: Colors.red, // Button color
                    ),
                    child: const Text(
                      "X",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: screenWidth * whiteAreaWidth * 0.3,
                child: TextButton(
                  onPressed: () {
                    // When the user taps the button,
                    // navigate to a named route and
                    // provide the arguments as an optional
                    // parameter.
                    if (playersList[index].denominationCount.isEmpty) {
                      playersList[index].denominationCount = List<int>.filled(
                        denominationList.length,
                        0,
                      );
                    }
                    playersList[index].base = playerbase;
                    playersList[index].updateValues();
                    Navigator.pushNamed(
                      context,
                      '/chipPage',
                      arguments: ScreenArguments(index),
                    );
                  },
                  style: TextButton.styleFrom(
                    // styling the button
                    padding: const EdgeInsets.all(1),
                    backgroundColor: Colors.white, // Button color
                  ),
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * cardHeight,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            playersList[index].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          playersList[index].directAmountMode
                              ? Icons.attach_money
                              : Icons.casino,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth * whiteAreaWidth * 0.5,
          height: screenHeight * whiteAreaHeight * cardHeight,
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.black,
          //     width: 1,
          //   ),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    playersList[index].increasebuyin();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    // styling the button
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(1),
                    backgroundColor: Colors.white, // Button color
                  ),
                  child: const Text(
                    "+",
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  ),
                ),
              ),
              Container(
                width: screenWidth * buttonWidth,
                alignment: Alignment.center,
                child: Text(
                  "${playersList[index].buyin}",
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                width: screenWidth * buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    playersList[index].decreasebuyin(1);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    // styling the button
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(1),
                    backgroundColor: Colors.white, // Button color
                  ),
                  child: const Text(
                    "-",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
