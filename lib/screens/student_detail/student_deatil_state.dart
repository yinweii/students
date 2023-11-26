import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/api/network_resource_state/network_resource_state.dart';
import 'package:students/models/student_detail.dart';

part 'student_deatil_state.freezed.dart';

@freezed
class StudentDetailState with _$StudentDetailState {
  factory StudentDetailState({
    @Default(NetworkResourceState.loading())
    NetworkResourceState<StudentDetail> studentDetail,
    StudentDetail? student,
  }) = _StudentDetailState;
}
