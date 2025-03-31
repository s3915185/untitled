import 'package:flutter/widgets.dart';
import 'package:untitled/widgets/chart/SingleCandleChart.dart';

import '../../utils/CommonUtils.dart';

class BalanceDisplay extends StatelessWidget {
  final double currentBalance;
  final double spentBalance;
  final double totalBalance;

  const BalanceDisplay({
    Key? key,
    required this.currentBalance,
    required this.spentBalance,
    required this.totalBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Available spending balance",
              style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
            ),
            Text(
              CommonUtils.formatCurrency(currentBalance),
              style: TextStyle(fontSize: 32, fontFamily: 'Inter - Bold'),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Current limit",
                  style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
                ),
                Text(
                  CommonUtils.formatCurrency(totalBalance),
                  style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
                ),
              ],
            ),

            SingleCandleChart(
              currentValue: spentBalance,
              maxValue: totalBalance,
            ),

            Text(
              "Spent ${CommonUtils.formatCurrency(spentBalance)}",
              style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
            ),
          ],
        ),
      ],
    );
  }
}
