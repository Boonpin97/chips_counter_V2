import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/widgets/playercard.dart';
import '/class/players.dart';
import '/params.dart';

const whiteAreaWidth = 0.8;
const whiteAreaHeight = 0.6;
const titleHeight = 0.1;
const addButtonHeight = 0.08;

class PlayerBuyIn extends StatefulWidget {
  List<Players> playersList;

  PlayerBuyIn(this.playersList, {Key? key}) : super(key: key);

  @override
  _PlayerBuyInState createState() => _PlayerBuyInState(playersList);
}

class _PlayerBuyInState extends State<PlayerBuyIn> {
  var controller = TextEditingController();
  List<Players> playersList;

  _PlayerBuyInState(this.playersList);

  void removePlayer(int index) {
    setState(() {
      playersList.removeAt(index);
    });
  }

  void _addButtonFunction() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 700,
          color: Colors.green[500],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    const Text(
                      "Enter player name:",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      maxLength: 11,
                      controller: controller,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[200],
                        ),
                        hintText: "Insert Here",
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: 50,
                      width: 100,
                      color: Colors.green[500],
                      child: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.check),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                          if (controller.text.isNotEmpty) {
                            playersList.add(Players(controller.text, playerbase));
                            print(playersList);
                            setState(() {
                              controller.text = "";
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
      alignment: Alignment.center,
      width: screenWidth * whiteAreaWidth,
      height: screenHeight * whiteAreaHeight,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: screenWidth * whiteAreaWidth / 2,
                height: screenHeight * whiteAreaHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Players',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.underline),
                ),
              ),
              Container(
                width: screenWidth * whiteAreaWidth / 2,
                height: screenHeight * whiteAreaHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Buy-ins',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(
            //color: Colors.green,
            width: screenWidth * whiteAreaWidth,
            height: (playersList.length < 8)
                ? screenHeight * whiteAreaHeight - screenHeight * whiteAreaHeight * (titleHeight + addButtonHeight)
                : screenHeight * whiteAreaHeight - screenHeight * whiteAreaHeight * (titleHeight),

            child: ListView.builder(
              itemCount: playersList.length,
              itemBuilder: (context, index) {
                return PlayerCard(index, playersList, removePlayer);
              },
            ),
          ),
          (playersList.length < 8)
              ? Container(
                  width: screenWidth * whiteAreaWidth,
                  height: screenHeight * whiteAreaHeight * addButtonHeight,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: _addButtonFunction,
                    style: ElevatedButton.styleFrom(
                      // styling the button
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(1),
                      backgroundColor: Colors.white, // Button color
                    ),
                    child: Container(
                        width: screenWidth * whiteAreaWidth,
                        child: const Icon(Icons.add, color: Colors.green)), // icon of the button
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
