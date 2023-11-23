import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/models/class_model.dart';
import 'package:students/models/point.dart';
import 'package:students/models/student.dart';
import 'package:students/screens/student_list/student_list_state.dart';

final studentLsitProvider = StateNotifierProviderFamily<
    StudentListStateNotifier, StudentListState, Class?>((ref, classData) {
  return StudentListStateNotifier(ref, classData);
});

class StudentListStateNotifier extends StateNotifier<StudentListState> {
  StudentListStateNotifier(this.ref, this.classData)
      : super(StudentListState()) {
    _getAllStudent();
  }

  Ref ref;
  final Class? classData;

  Future<void> _getAllStudent() async {
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

  void updateStudentPoint(Student? studentUpadte, String? note) {
    final newPoint = StudentPoint(
      createAt: (state.selectDate ?? DateTime.now()).toString(),
      noise: state.noiseLevel,
      takeGood: state.goodTakeLevel,
      note: note,
    );
    if (studentUpadte == null) {
      return;
    }
    final indexOfStudent = state.students.indexOf(studentUpadte);

    // final update = student.copyWith(
    //   points: [...student.points ?? [], newPoint],
    // );

    state = state.copyWith(students: state.students);
  }
}
