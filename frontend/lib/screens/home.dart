import 'package:flutter/material.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/widgets/handler/PieChartHandler.dart';
import 'package:untitled/widgets/account/AccountBadge.dart';
import 'package:untitled/widgets/balance/BalanceDisplay.dart';
import 'package:untitled/widgets/chart/PieChart.dart';
import '../layouts/BasicLayout.dart';
import '../widgets/message/BlockMessage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicLayout(
        childrens: [
          AccountBadge(
            imagePath: Constants.PICTURE_PERSON,
            label: "Alexander Lincoln",
          ),
          BalanceDisplay(
            currentBalance: 75986213,
            spentBalance: 178856956,
            totalBalance: 254843169,
          ),
          PieChartHandler(),
          BlockMessage(
            header: "AI automated advice",
            message:
                "If you reduce spending by 7% in Utilities, you’ll have an extra 12,520,000 VND for future goals...",
          ),
        ],
      ),
    );
  }
}
