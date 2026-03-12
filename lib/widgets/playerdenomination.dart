import 'package:chip_counter/pages/home.dart';
import 'package:chip_counter/widgets/chipscard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/widgets/playercard.dart';
import '/class/players.dart';
import '/widgets/chipscard.dart';
import '/params.dart';

const whiteAreaWidth = 0.8;
const whiteAreaHeight = 0.6;
const titleHeight = 0.1;
const addButtonHeight = 0.08;

class PlayerDenomination extends StatefulWidget {
  Players player;
  final Function _handler;
  PlayerDenomination(this.player, this._handler, {Key? key}) : super(key: key);
  @override
  _PlayerDenominationState createState() =>
      _PlayerDenominationState(player, _handler);
}

class _PlayerDenominationState extends State<PlayerDenomination> {
  var controller = TextEditingController();
  final Function _handler;

  Players player;
  _PlayerDenominationState(this.player, this._handler);
  void _setStateHandler() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
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
                  'Denomination',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                width: screenWidth * whiteAreaWidth / 2,
                height: screenHeight * whiteAreaHeight * titleHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Quantity',
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
          Expanded(
            child: ListView.builder(
              itemCount: denominationList.length,
              itemBuilder: (context, index) {
                return ChipsCard(index, player, _handler);
              },
            ),
          ),
        ],
      ),
    );
  }
}
