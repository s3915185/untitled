import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/utils/ImageUtils.dart';

import '../../Constants.dart';
import '../../events/chat/ChatSliderEventNotifier.dart';

class NavBarItem extends StatefulWidget {
  final String label;
  final double heightAndWidth;
  final String assetPath;
  final bool isClrAround;
  final VoidCallback onTap;
  final bool isActive;
  final bool isActiveLongPress;

  const NavBarItem({
    Key? key,
    required this.assetPath,
    required this.label,
    required this.heightAndWidth,
    required this.isClrAround,
    required this.isActive,
    required this.onTap,
    this.isActiveLongPress = false,
  }) : super(key: key);

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  void _handleLongPress() {
    if (widget.isActiveLongPress) {
      ChatSliderEventNotifier.triggerLongPressEvent();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color colorToRender =
        widget.isActive ? Constants.COLOR_STRONG_BLUE : Colors.black;
    Color colorToRenderForRing =
        widget.isActive
            ? Constants.COLOR_STRONG_BLUE
            : Colors.black.withAlpha((0.25 * 255).round());

    return GestureDetector(
      onLongPress: _handleLongPress,
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: ValueListenableBuilder(
        valueListenable: ChatSliderEventNotifier.isOpenSlider,
        builder: (context, isLongPressed, child) {
          return Container(
            height: widget.heightAndWidth,
            width: widget.heightAndWidth,
            decoration:
                widget.isClrAround
                    ? BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(
                        widget.heightAndWidth,
                      ),
                      border: Border.all(color: colorToRenderForRing, width: 1),
                      color: Colors.transparent,
                    )
                    : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageUtils.formatSvg(widget.assetPath, 24, color: colorToRender),
                const SizedBox(height: 5),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: colorToRender,
                    fontSize: 12,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
