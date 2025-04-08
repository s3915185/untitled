import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../layouts/BasicLayout.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicLayout(
        childrens: [
          Text("Insights Screen", style: TextStyle(fontSize: 24))
        ],
      ),
    );
  }
}
