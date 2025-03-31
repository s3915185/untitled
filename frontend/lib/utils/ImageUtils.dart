import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ImageUtils {
  static String formatCurrency(dynamic amount) {
    NumberFormat formatter;

    if (amount is double && amount % 1 != 0) {
      formatter = NumberFormat("#,##0.000", "en_US");
    } else {
      formatter = NumberFormat("#,##0", "en_US");
    }

    return "${formatter.format(amount)} VND";
  }

  static SvgPicture formatSvg(String assetPath, double height, {Color? color}) {
    return SvgPicture.asset(
      assetPath,
      height: height,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  static Image formatJpg(String assetPath, double heightAndWidth) {
    return Image.asset(
      assetPath,
      width: heightAndWidth,
      height: heightAndWidth,
      fit: BoxFit.cover,
    );
  }
}