import 'package:flutter/material.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/widgets/handler/PieChartHandler.dart';
import 'package:untitled/widgets/account/AccountBadge.dart';
import 'package:untitled/widgets/balance/BalanceDisplay.dart';
import '../layouts/BasicLayout.dart';
import '../widgets/message/BlockMessage.dart';
import 'homeService.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<Map<String, dynamic>?> fetchData() async {
    final homeService = HomeService();
    return await homeService.getUserInfo(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchData(),
        builder: (context, snapshot) {
          final userName = snapshot.data?['name'] ?? 'Loading...';

          return BasicLayout(
            childrens: [
              AccountBadge(
                imagePath: Constants.PICTURE_PERSON,
                label: userName,
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
          );
        },
      ),
    );
  }
}