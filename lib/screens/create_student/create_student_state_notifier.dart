import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/models/class_model.dart';
import 'package:students/screens/create_student/create_student_state.dart';

enum Gender { male, female }

final createStudentProvider =
    StateNotifierProvider<CreateStudentStateNotifier, CreateStudentState>(
        (ref) {
  return CreateStudentStateNotifier(ref);
});

class CreateStudentStateNotifier extends StateNotifier<CreateStudentState> {
  CreateStudentStateNotifier(this.ref) : super(CreateStudentState()) {
    _getAllClass();
  }
  Ref ref;

  Future<void> _getAllClass() async {
    try {
      state = state.copyWith(showLoadingIndicator: true);
      final result = await apiClient(ref)
          .getRequest(ApiEndpoints.classApi, isAuthorized: true);
      if (result is! ApiResponse || !result.success) {
        return;
      }
      final classes = (result.data as List)
          .map((e) => Class.fromMap(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(classes: classes);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(classes: []);
    }
  }

  void onSelectClassType(ClassType? classType) {
    state = state.copyWith(classType: classType);
  }

  void onSelectClass(Class? classData) {
    state = state.copyWith(onSelectClass: classData);
  }

  void onSelectGender(Gender? gender) {
    state = state.copyWith(selectGender: gender ?? state.selectGender);
  }

  void onSelectDatetime(DateTime? datetime) {
    state = state.copyWith(selectDatetime: datetime);
  }
}

class ClassType {
  final String name;
  final String value;
  ClassType({required this.name, required this.value});
}

List<ClassType> classTypeDumy = [
  ClassType(name: 'Chính quy', value: 'official'),
  ClassType(name: 'Dạy thêm', value: 'other'),
];
