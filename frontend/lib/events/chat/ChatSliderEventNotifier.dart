import 'package:flutter/material.dart';

class ChatSliderEventNotifier {
  static final ValueNotifier<bool> isOpenSlider = ValueNotifier(false);

  static void triggerExpandEvent() {
    isOpenSlider.value = true;
  }

  static void triggerLongPressEvent() {
    isOpenSlider.value = true;
  }

  static void closeSlider() {
    isOpenSlider.value = false;
  }
}
