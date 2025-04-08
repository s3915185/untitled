import 'package:flutter/material.dart';
import 'package:untitled/widgets/chart/SquareActionButton.dart';
import '../layouts/BasicLayout.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicLayout(
        childrens: [
          Text("Actions", style: TextStyle(fontSize: 12, fontFamily: 'Inter')),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SquareActionWindow(actionName: "Input new transactions"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
