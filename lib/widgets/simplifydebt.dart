import 'package:flutter/material.dart';
import '/class/players.dart';

class SimplifyDebt extends StatelessWidget {
  final List<Players> playersList;
  SimplifyDebt(this.playersList, {Key? key}) : super(key: key);

  /// Computes settlement transactions without mutating any Player objects.
  String _buildDebtString(List<Players> players) {
    // Build local mutable copies of names and amounts
    List<String> giverNames = [];
    List<double> giverAmounts = [];
    List<String> receiverNames = [];
    List<double> receiverAmounts = [];

    for (final p in players) {
      if (p.earning < -0.005) {
        giverNames.add(p.name);
        giverAmounts.add(p.earning.abs());
      } else if (p.earning > 0.005) {
        receiverNames.add(p.name);
        receiverAmounts.add(p.earning);
      }
    }

    // Sort both lists largest-first for fewest transactions
    final giverOrder = List.generate(giverNames.length, (i) => i)
      ..sort((a, b) => giverAmounts[b].compareTo(giverAmounts[a]));
    giverNames = [for (final i in giverOrder) giverNames[i]];
    giverAmounts = [for (final i in giverOrder) giverAmounts[i]];

    final receiverOrder = List.generate(receiverNames.length, (i) => i)
      ..sort((a, b) => receiverAmounts[b].compareTo(receiverAmounts[a]));
    receiverNames = [for (final i in receiverOrder) receiverNames[i]];
    receiverAmounts = [for (final i in receiverOrder) receiverAmounts[i]];

    String result = '';
    int gi = 0, ri = 0;
    while (gi < giverNames.length && ri < receiverNames.length) {
      final pay = giverAmounts[gi] < receiverAmounts[ri]
          ? giverAmounts[gi]
          : receiverAmounts[ri];
      result +=
          '${giverNames[gi]}  →  ${receiverNames[ri]}   ${pay.toStringAsFixed(2)}\n';
      giverAmounts[gi] -= pay;
      receiverAmounts[ri] -= pay;
      if (giverAmounts[gi] < 0.005) gi++;
      if (receiverAmounts[ri] < 0.005) ri++;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    double net = 0;
    for (final player in playersList) {
      net += player.earning;
    }
    final bool hasMismatch = net.abs() > 0.005;
    final String debtString = _buildDebtString(playersList);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasMismatch)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              border: Border.all(color: Colors.orange, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded,
                    color: Colors.orange, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    net > 0
                        ? 'Surplus of ${net.toStringAsFixed(2)}\n'
                            'Total chip value exceeds total buy-ins. '
                            'Someone may have too many chips — please recount.'
                        : 'Shortage of ${net.abs().toStringAsFixed(2)}\n'
                            'Total chip value is less than total buy-ins. '
                            'Some chips may be missing — please recount.',
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        if (debtString.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              debtString,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          )
        else if (!hasMismatch)
          const Text(
            'All settled!',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
      ],
    );
  }
}
