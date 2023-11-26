import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/models/class_model.dart';
import 'package:students/models/point.dart';
import 'package:students/models/student.dart';
import 'package:students/screens/student_list/student_list_state.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

final studentLsitProvider = StateNotifierProviderFamily<
    StudentListStateNotifier, StudentListState, Class?>((ref, classData) {
  return StudentListStateNotifier(ref, classData);
});

class StudentListStateNotifier extends StateNotifier<StudentListState> {
  StudentListStateNotifier(this.ref, this.classData)
      : super(StudentListState()) {
    getAllStudent();
  }

  Ref ref;
  final Class? classData;

  Future<void> getAllStudent() async {
    try {
      state = state.copyWith(showLoadingIndicator: true);
      final result = await apiClient(ref)
          .getRequest(ApiEndpoints.student, isAuthorized: true, params: {
        'classId': classData?.id,
      });
      if (result is! ApiResponse || !result.success) {
        return;
      }
      final students = (result.data as List)
          .map((e) => Student.fromMap(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(students: students, showLoadingIndicator: false);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(showLoadingIndicator: false);
    }
  }

  void onCheckIn(Student student) {
    if (state.lsCheckin.contains(student)) {
      state = state.copyWith(lsCheckin: [...state.lsCheckin]..remove(student));
    } else {
      state = state.copyWith(lsCheckin: [...state.lsCheckin, student]);
    }
  }

  void onTapNosieLevel(int index) {
    if (index == 0 && state.noiseLevel == 0) {
      state = state.copyWith(noiseLevel: -1);
      return;
    }
    state = state.copyWith(noiseLevel: index);
  }

  void onTapGoodTakeLevel(int index) {
    if (index == 0 && state.goodTakeLevel == 0) {
      state = state.copyWith(goodTakeLevel: -1);
      return;
    }
    state = state.copyWith(goodTakeLevel: index);
  }

  void onSelectedDate(DateTime date) {
    state = state.copyWith(selectDate: date);
  }

  void updateStudentPoint(Student? studentUpadte, String? note) {}

  Future<void> createStudentPoint({
    int? studentId,
    String? speech,
    String? pressPosition,
    String? noise,
    String? goodTake,
    String? beats,
    String? note,
  }) async {
    try {
      final params = {
        'student_id': studentId,
        'speech': speech,
        'press_position': pressPosition,
        'noise': noise,
        'good_take': goodTake,
        'beats': beats,
        'date': state.selectDate != null
            ? state.selectDate.toString()
            : DateTime.now().toString(),
        'note': note,
      };
      final result = await apiClient(ref).postRequest(
        ApiEndpoints.studentPoint,
        params: params,
        isAuthorized: true,
      );
      if (result is! ApiResponse || !result.success) {
        return;
      }
      EasyLoading.showSuccess('Success!');
    } catch (e) {
      log(e.toString());
    }
  }
}
