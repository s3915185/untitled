import 'package:flutter/material.dart';

class HeadSlider extends StatefulWidget {
  final ValueNotifier<bool> isExpandedNotifier;

  const HeadSlider({Key? key, required this.isExpandedNotifier})
      : super(key: key);

  @override
  State<HeadSlider> createState() => _HeadSliderState();
}

class _HeadSliderState extends State<HeadSlider> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta != null && details.primaryDelta! > 5) {
          widget.isExpandedNotifier.value = false;
        }
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: widget.isExpandedNotifier,
        builder: (context, isLongPressed, child) {
          return Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black.withAlpha((0.05 * 255).round()),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.05 * 255).round()),
                  blurRadius: 100,
                  spreadRadius: 2,
                  offset: const Offset(0, -8),
                ),
              ],
            ),
            child: Center(
              child: Container(
                height: 3,
                width: isLongPressed ? 100 : 70,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
