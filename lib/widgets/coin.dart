import 'package:flutter/material.dart';
import '/params.dart';

class Coin extends StatelessWidget {
  final int index;
  final List<String> denominationList;
  final Function _handleValue;

  Coin(this._handleValue, this.denominationList, this.index);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => _handleValue(index),
        style: ElevatedButton.styleFrom(
          // styling the button
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(1),
          backgroundColor: coinColor[index], // Button color
        ),
        child: Text(denominationList[index]), // icon of the button
      ),
    );
  }
}
