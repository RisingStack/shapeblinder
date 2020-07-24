import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

void lightHaptic() {
  if (Platform.isIOS) {
    HapticFeedback.lightImpact();
  }
}

void vibrateHaptic() {;
  if (Platform.isIOS) {
    HapticFeedback.heavyImpact();
  } else {
    // somewhy this is the only solution that works on Android...
    Vibration.vibrate(duration: 100);
  }
}
