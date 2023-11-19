import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/models/class_model.dart';
import 'package:students/screens/class_list/class_list_state.dart';
import 'package:uuid/uuid.dart';

final classListProvider =
    StateNotifierProvider<ClassListStateNotifier, ClassListState >((ref) {
  return ClassListStateNotifier();
});

class ClassListStateNotifier extends StateNotifier<ClassListState> {
  ClassListStateNotifier() : super(ClassListState()) {
    state = state.copyWith(classes: classesDumpy);
  }

  void addClass(Class newClass) {
    var colors = [
      '#FF0000',
      '#FFA500',
      '#FFFF00',
      '#008000',
      '#0000FF',
      '#4B0082',
      '#EE82EE',
    ];
    final hashColor = colors..shuffle();
    final result = newClass.copyWith(
      id: const Uuid().v1(),
      hashColor: hashColor.first,
    );

    state = state.copyWith(classes: [...state.classes, result]);
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
