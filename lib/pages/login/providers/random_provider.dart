import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomNotifier extends StateNotifier<String> {
  RandomNotifier() : super("") {
    getRandomCaptcha();
  }

  void getRandomCaptcha() {
    String randomStr = "";
    for (int i = 0; i < 17; i++) {
      randomStr += i == 0 ? (Random().nextInt(9) + 1).toString() : Random().nextInt(10).toString();
    }
    randomStr += "0";
    state = randomStr;
  }
}

final randomProvider = StateNotifierProvider<RandomNotifier, String>((ref) {
  return RandomNotifier();
});
