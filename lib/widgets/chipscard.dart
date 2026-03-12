import 'package:chip_counter/widgets/denomination.dart';
import 'package:flutter/material.dart';
import '/params.dart';
import '/class/players.dart';

const whiteAreaWidth = 0.8;
const whiteAreaHeight = 0.6;
const cardHeight = 0.1;
const buttonWidth = 0.09;

class ChipsCard extends StatefulWidget {
  int index;
  Players player;
  final Function _handler;
  ChipsCard(this.index, this.player, this._handler, {Key? key})
    : super(key: key);

  @override
  State<ChipsCard> createState() => _ChipsCardState(index, player, _handler);
}

class _ChipsCardState extends State<ChipsCard> {
  int index;
  Players player;
  int quantity = 0;
  final Function _handler;

  _ChipsCardState(this.index, this.player, this._handler) {
    quantity = player.denominationCount[index];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Container(
            width: screenWidth * whiteAreaWidth / 2,
            height: screenHeight * whiteAreaHeight * cardHeight,
            alignment: Alignment.center,
            child: Container(
              width: 50,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // styling the button
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(1),
                  backgroundColor: coinColor[index], // Button color
                ),
                child: Text(
                  denominationList[index].toString(),
                ), // icon of the button
              ),
            ),
          ),
          Container(
            width: screenWidth * whiteAreaWidth / 2,
            height: screenHeight * whiteAreaHeight * cardHeight,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      player.denominationCount[index]++;
                      _handler();
                      setState(() {
                        quantity = player.denominationCount[index];
                      });
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
                    "$quantity",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: screenWidth * buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      player.denominationCount[index]--;
                      _handler();
                      setState(() {
                        quantity = player.denominationCount[index];
                      });
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
      ),
    );
  }
}
