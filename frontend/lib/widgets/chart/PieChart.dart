import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/dto/PieChartElement.dart';

class PieChart extends StatefulWidget {
  final List<PieChartElement> pieChartElements;

  const PieChart({Key? key, required this.pieChartElements}) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class ValueAndIndex {
  double? value;
  int? index;

  ValueAndIndex(this.value, this.index);
}

class HeightAndWidth {
  double? horizontal;
  double? vertical;

  HeightAndWidth(this.horizontal, this.vertical);
}

class _PieChartState extends State<PieChart> {
  List<ValueAndIndex> _computeLabelPositions() {
    List<ValueAndIndex> positions = [];
    double start = 0;
    for (int i = 0; i < widget.pieChartElements.length; i++) {
      double? value = widget.pieChartElements[i].percentage;
      double halfValue = value! / 2;
      positions.add(ValueAndIndex(start + halfValue, i));
      start = halfValue;
    }

    return positions;
  }

  @override
  Widget build(BuildContext context) {
    List<ValueAndIndex> labelPositions = _computeLabelPositions();

    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [..._buildSegments(), ..._buildLabels(labelPositions)],
      ),
    );
  }

  List<Widget> _buildLabels(List<ValueAndIndex> labelPositions) {
    double startAngle = 180;
    double total = widget.pieChartElements.fold(
      0,
      (sum, item) => sum + (item.percentage ?? 0),
    );

    List<HeightAndWidth> offsets =
        labelPositions.map((element) {
          double sweepAngle = element.value! / total * 360;
          startAngle += sweepAngle;

          return HeightAndWidth(
            130 * cos(startAngle * pi / 180),
            130 * sin(startAngle * pi / 180),
          );
        }).toList();

    return List.generate(labelPositions.length, (i) {
      return Positioned(
        left: 0 + offsets[i].horizontal!,
        top: 0 + offsets[i].vertical!,
        child: SizedBox(
          width: 300,
          height: 300,

          child: Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 45,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withAlpha((0.5 * 255).round()),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      "${(widget.pieChartElements[labelPositions[i].index!].percentage)?.round()}%",
                      style: TextStyle(
                        fontFamily: 'Inter - Bold',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  List<Widget> _buildSegments() {
    double startAngle = -90;
    double total = widget.pieChartElements.fold(
      0,
      (sum, item) => sum + (item.percentage ?? 0),
    );

    return widget.pieChartElements.map((element) {
      double sweepAngle = (element.percentage ?? 0) / total * 360;
      double progressValue = (element.percentage ?? 0) / 100;

      Widget segment = Positioned.fill(
        child: Transform.rotate(
          angle: startAngle * pi / 180,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 250,
              height: 250,
              child: CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 25,
                strokeCap: StrokeCap.butt,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(element.color),
              ),
            ),
          ),
        ),
      );

      startAngle += sweepAngle;
      return segment;
    }).toList();
  }
}
