import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/api/network_resource_state/network_resource_state.dart';
import 'package:students/models/student.dart';
import 'package:students/models/student_detail.dart';

part 'all_student_state.freezed.dart';

@freezed
class AllStudentState with _$AllStudentState {
  factory AllStudentState({
    @Default(false) bool success,
    @Default(false) bool loadingIndicator,
    @Default(<StudentDetail>[]) List<StudentDetail> lsStudent,
  }) = _AllStudentState;
}
