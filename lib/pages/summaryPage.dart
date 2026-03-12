import 'package:chip_counter/widgets/simplifydebt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/class/players.dart';
import '/widgets/playerearning.dart';
import 'dart:math';
import '/widgets/simplifydebt.dart';

class SummaryPage extends StatelessWidget {
  List<Players> playersList;
  SummaryPage(this.playersList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
            PlayerEarning(playersList),
            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              height: screenHeight * 0.1,
              child: const Text(
                'Simplified Debt',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            SimplifyDebt(playersList),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
