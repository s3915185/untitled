import 'package:flutter/material.dart';
import '../../Constants.dart';
import '../../abstract/EnumAndTranslation.dart';

class ListElementHandler extends StatefulWidget {
  final List<EnumAndTranslation> elements;

  const ListElementHandler({Key? key, required this.elements})
    : super(key: key);

  @override
  State<ListElementHandler> createState() => _ListElementHandlerState();
}

class _ListElementHandlerState extends State<ListElementHandler> {
  late EnumAndTranslation selectedElement;

  @override
  void initState() {
    super.initState();
    if (widget.elements.isNotEmpty) {
      selectedElement = widget.elements.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children:
          widget.elements.map((element) {
            bool isActive = selectedElement.enumType == element.enumType;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedElement = element;
                });
              },
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                child: Text(
                  element.enumTranslation,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    color:
                        isActive
                            ? Constants.COLOR_STRONG_BLUE
                            : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
