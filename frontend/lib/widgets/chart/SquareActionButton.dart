import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../enum/NavBarTabType.dart';
import '../../main.dart';
import '../../utils/ImageUtils.dart';

class SquareActionWindow extends StatelessWidget {
  final String? actionName;

  const SquareActionWindow({Key? key, this.actionName}) : super(key: key);

  void _navigateToInputTransaction() {
    homePageKey.currentState?.switchTab(NavBarTabType.INPUT_TRANSACTION);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToInputTransaction,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black.withAlpha((0.05 * 255).round()),
            width: 1,
          ),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                ImageUtils.formatJpg(Constants.ICON_CALCULATOR, 30),
                Text(
                  "$actionName",
                  style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
                ),
              ],
            ),
            ImageUtils.formatSvg(Constants.ICON_ARROW_RIGHT, 30),
          ],
        ),
      ),
    );
  }
}
