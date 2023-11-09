import 'package:flutter/material.dart';

extension StringX on String {
  String get overflow => Characters(this)
      .replaceAll(Characters(''), Characters('\u{200B}'))
      .toString();

  dynamic toStringExtension() {
    return isEmpty ? null : toString();
  }

  String formatImageName() {
    return replaceAll(RegExp(' +'), ' ').trim().replaceAll('\n', '');
  }
}
