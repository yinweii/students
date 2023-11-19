import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/models/category.dart';
import 'package:students/models/class_model.dart';
import 'package:students/models/point.dart';
import 'package:students/models/student.dart';
import 'package:students/screens/student_list/student_list_state.dart';

final studentLsitProvider = StateNotifierProviderFamily<
    StudentListStateNotifier, StudentListState, Class?>((ref, classData) {
  return StudentListStateNotifier();
});

class StudentListStateNotifier extends StateNotifier<StudentListState> {
  StudentListStateNotifier() : super(StudentListState()) {
    state = state.copyWith(students: studentsData);
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
    final student = studentsData[indexOfStudent];
    final update = student.copyWith(
      points: [...student.points ?? [], newPoint],
    );
    studentsData[indexOfStudent] = update;

    state = state.copyWith(students: state.students);
  }
}
