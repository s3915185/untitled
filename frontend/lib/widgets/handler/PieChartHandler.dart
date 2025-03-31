import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/dto/PieChartElement.dart';
import 'package:untitled/enum/TransactionCategory.dart';
import 'package:untitled/widgets/chart/PieChart.dart';
import 'package:untitled/widgets/handler/TypeAndValueHandler.dart';

class PieChartHandler extends StatelessWidget {
  const PieChartHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PieChart(pieChartElements: [
            PieChartElement(TransactionCategory.housingBills, 40, Colors.orange),
            PieChartElement(TransactionCategory.transportation, 5, Colors.blue),
            PieChartElement(TransactionCategory.subscriptions, 10, Colors.red),
            PieChartElement(TransactionCategory.food, 30, Colors.purple),
            PieChartElement(TransactionCategory.leisure, 15, Colors.green),
          ]),
          TypeAndValueHandler()
        ],
      ),
    );
  }
}
