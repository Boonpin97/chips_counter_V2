import 'package:chip_counter/widgets/calculatebutton.dart';
import 'package:flutter/material.dart';
import '/widgets/base.dart';
import '/widgets/denomination.dart';
import '/widgets/playerbuyin.dart';
import '/class/players.dart';
import '/params.dart';

const double boxSpacing = 0.01;

class HomePage extends StatefulWidget {
  List<Players> playersList;
  HomePage(this.playersList, {Key? key}) : super(key: key);
  @override
  _MyWidgetState createState() => _MyWidgetState(playersList);
}

class _MyWidgetState extends State<HomePage> {
  List<Players> playersList;

  _MyWidgetState(this.playersList);

  void updateBase(input) {
    playerbase = double.parse(input);
    print("Base updated: $playerbase");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDB8),
      appBar: AppBar(
        title: const Text(
          'Chips Counter',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: const Color(0xFF10E99A),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Base(updateBase),
            SizedBox(height: screenHeight * boxSpacing),
            const Denomination(),
            SizedBox(height: screenHeight * boxSpacing),
            PlayerBuyIn(playersList),
            CalculateButton(playersList, playerbase),
          ],
        ),
      ),
    );
  }
}
