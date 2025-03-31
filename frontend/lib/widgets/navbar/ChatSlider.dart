import 'package:flutter/material.dart';
import 'package:untitled/events/chat/ChatSliderEventNotifier.dart';

import 'HeadSlider.dart';

class ChatSlider extends StatelessWidget {
  const ChatSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ChatSliderEventNotifier.isOpenSlider,
      builder: (context, isLongPressed, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child:
                  isLongPressed
                      ? HeadSlider(
                        isExpandedNotifier:
                            ChatSliderEventNotifier.isOpenSlider,
                      )
                      : null,
            ),
            Container(
              padding:
                  isLongPressed
                      ? EdgeInsets.only(top: 10, left: 20, right: 20)
                      : EdgeInsets.zero,
              child:
                  isLongPressed
                      ? Text(
                        "Log your expenses",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Inter - Semi - Bold',
                        ),
                      )
                      : null,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isLongPressed ? 200 : 0,
              curve: Curves.easeInOut,
              padding:
                  isLongPressed
                      ? const EdgeInsets.symmetric(horizontal: 10)
                      : EdgeInsets.zero,
              child:
                  isLongPressed
                      ? TextField(
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 3,
                      )
                      : null,
            ),
          ],
        );
      },
    );
  }
}
