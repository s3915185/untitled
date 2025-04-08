import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../layouts/BasicLayout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicLayout(
        childrens: [
          Text("Setting Screen", style: TextStyle(fontSize: 24))
        ],
      ),
    );
  }
}
