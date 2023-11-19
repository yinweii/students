import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/models/student.dart';

part 'student_list_state.freezed.dart';

@freezed
class StudentListState with _$StudentListState {
  factory StudentListState({
    List<String>? name,
    @Default(<Student>[]) List<Student> students,
    @Default(<Student>[]) List<Student> lsCheckin,
    @Default(-1) int noiseLevel,
    @Default(-1) int goodTakeLevel,
    DateTime? selectDate,

  }) = _StudentListState;
}
