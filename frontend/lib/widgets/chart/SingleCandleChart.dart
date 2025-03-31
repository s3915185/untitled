import 'package:flutter/material.dart';

class SingleCandleChart extends StatelessWidget {
  final double currentValue;
  final double maxValue;

  const SingleCandleChart({
    Key? key,
    required this.currentValue,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fullWidth = constraints.maxWidth;

        return SizedBox(
          width: fullWidth,
          child: Stack(
            children: [
              Container(
                height: 1.5,
                width: fullWidth,
                color: Colors.grey,
              ),
              Container(
                height: 1.5,
                width: (currentValue / maxValue) * fullWidth,
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}