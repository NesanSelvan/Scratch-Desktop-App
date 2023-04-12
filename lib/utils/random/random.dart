import 'dart:math';

import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class RandomGenerator {
  static Color get generateColor {
    final Random _random = Random();
    return Color.fromARGB(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}
