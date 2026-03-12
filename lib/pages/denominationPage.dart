import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/playerdenomination.dart';
import '/class/players.dart';
import '/params.dart';

const double boxSpacing = 0.01;
const double playerNameSpacing = 0.05;
const double summarySpacing = 0.2;

class DenominationPage extends StatefulWidget {
  List<Players> playersList;
  DenominationPage(this.playersList, {Key? key}) : super(key: key);

  @override
  State<DenominationPage> createState() => _DenominationPageState(playersList);
}

class _DenominationPageState extends State<DenominationPage> {
  List<Players> playersList;
  final amountController = TextEditingController();
  bool _initialized = false;

  _DenominationPageState(this.playersList);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments?;
      if (args != null) {
        final player = playersList[args.index];
        if (player.directAmountMode) {
          // Restore the previously saved amount text, falling back to chip total
          amountController.text = player.savedAmountText.isNotEmpty
              ? player.savedAmountText
              : (player.total > 0 ? player.total.toStringAsFixed(2) : '');
        }
      }
    }
  }

  void _setStateHandler() {
    for (int i = 0; i < playersList.length; i++) {
      if (!playersList[i].directAmountMode) {
        double total = 0;
        for (int j = 0; j < playersList[i].denominationCount.length; j++) {
          total +=
              playersList[i].denominationCount[j] *
              double.parse(denominationList[j]);
        }
        playersList[i].total = total;
        playersList[i].updateValues();
        print(playersList[i].name + playersList[i].denominationCount.toString());
      }
    }
    setState(() {});
  }

  Widget _buildAmountInput(Players player, double screenWidth) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      width: screenWidth * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'Enter Total Amount',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            style: const TextStyle(fontSize: 30, color: Colors.black),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: player.total > 0 ? player.total.toStringAsFixed(2) : '0.00',
              fillColor: Colors.white,
              filled: true,
            ),
            onChanged: (value) {
              final amount = double.tryParse(value);
              if (amount != null) {
                player.total = amount;
                player.updateValues();
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final int index = args.index;
    final player = playersList[index];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
            Container(
              width: screenWidth,
              height: screenHeight * playerNameSpacing,
              alignment: Alignment.center,
              child: Text(
                player.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Chips',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Switch(
                  value: player.directAmountMode,
                  activeColor: const Color(0xFF10E99A),
                  onChanged: (val) {
                    setState(() {
                      player.directAmountMode = val;
                      if (!val) {
                        // Switching back to chip mode — persist the entered amount, then recalculate total from chips
                        player.savedAmountText = amountController.text;
                        double total = 0;
                        for (int j = 0; j < player.denominationCount.length; j++) {
                          total += player.denominationCount[j] *
                              double.parse(denominationList[j]);
                        }
                        player.total = total;
                        player.updateValues();
                        amountController.clear();
                      } else {
                        // Switching to amount mode — restore saved amount if present, else use chip total
                        amountController.text = player.savedAmountText.isNotEmpty
                            ? player.savedAmountText
                            : (player.total > 0 ? player.total.toStringAsFixed(2) : '');
                        if (amountController.text.isNotEmpty) {
                          final amount = double.tryParse(amountController.text);
                          if (amount != null) {
                            player.total = amount;
                            player.updateValues();
                          }
                        }
                      }
                    });
                  },
                ),
                const Text(
                  'Amount',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: screenHeight * boxSpacing),
            player.directAmountMode
                ? _buildAmountInput(player, screenWidth)
                : PlayerDenomination(player, _setStateHandler),
            SizedBox(height: screenHeight * boxSpacing),
            Container(
              width: screenWidth,
              height: screenHeight * summarySpacing,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Chips Value: ${player.total.toStringAsFixed(2)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "Earnings: ${player.earning.toStringAsFixed(2)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
