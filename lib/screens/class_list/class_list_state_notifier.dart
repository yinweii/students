import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/api/network_resource_state/network_resource_state.dart';
import 'package:students/common/core/constants.dart';
import 'package:students/models/category.dart';
import 'package:students/models/class_model.dart';
import 'package:students/screens/class_list/class_list_state.dart';
import 'package:uuid/uuid.dart';

final classListProvider =
    StateNotifierProvider.autoDispose<ClassListStateNotifier, ClassListState>(
        (ref) {
  return ClassListStateNotifier(ref);
});

class ClassListStateNotifier extends StateNotifier<ClassListState> {
  ClassListStateNotifier(this.ref) : super(ClassListState()) {
    _getAllClass();
    // state = state.copyWith(classes: classesDumpy);
  }
  Ref ref;

  Future<void> _getAllClass() async {
    try {
      state = state.copyWith(lsClass: const NetworkResourceState.loading());
      final result = await apiClient(ref)
          .getRequest(ApiEndpoints.classApi, isAuthorized: true);
      if (result is! ApiResponse || !result.success) {
        return;
      }
      final classes = (result.data as List)
          .map((e) => Class.fromMap(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(
          lsClass: NetworkResourceState(classes), classes: classes);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(lsClass: NetworkResourceState.error(e.toString()));
    }
  }

  Future<void> deleteClass(Class classData) async {
    state = state.copyWith(
        classes: [...state.classes]..removeWhere((e) => e.id == classData.id));
  }

  Future<void> createNewClass(Class newClass) async {
    final param = {"name": 'Lớp 6A3', "total": 22, "type": "official"};
    try {
      final result = await apiClient(ref).postRequest(
        ApiEndpoints.classApi,
        isAuthorized: true,
        params: param,
      );

      if (result is! ApiResponse || !result.success) {}
      final newClass = Class.fromMap(result.data as Map<String, dynamic>);
      state = state.copyWith(classes: [...state.classes, newClass]);
    } catch (e) {
      log(e.toString());
    }
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
