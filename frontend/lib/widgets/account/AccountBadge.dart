import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/utils/ImageUtils.dart';

class AccountBadge extends StatelessWidget {
  final String? imagePath;
  final String? label;

  const AccountBadge({Key? key, required this.imagePath, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            ClipOval(
              child: ImageUtils.formatJpg(imagePath!, 34),
            ),
            Text(
              label!,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter - Bold',
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(34),
            border: Border.all(
              color: Colors.black.withAlpha((0.05 * 255).round()),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.30 * 255).round()),
                blurRadius: 50,
                spreadRadius: 0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SizedBox(
            height: 20,
            width: 20,
            child: ImageUtils.formatSvg(
              Constants.ICON_NOTIFICAITON,
              20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
