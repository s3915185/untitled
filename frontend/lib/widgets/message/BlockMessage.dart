import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlockMessage extends StatelessWidget {
  final String? header;
  final String? message;

  const BlockMessage({Key? key, required this.header, required this.message})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(header!, style: TextStyle(fontFamily: 'Inter'),)
        ),
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withAlpha((0.05 * 255).round()), width: 1),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha((0.20 * 255).round()),
                  blurRadius: 100,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(message!, style: TextStyle(fontFamily: 'Inter', fontSize: 14))
        )
      ],
    );
  }
}
