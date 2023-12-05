import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/api/network_resource_state/network_resource_state.dart';
import 'package:students/models/checkin.dart';
import 'package:students/models/student.dart';
import 'package:students/models/student_detail.dart';

part 'student_list_state.freezed.dart';

@freezed
class StudentListState with _$StudentListState {
  factory StudentListState({
    List<String>? name,
    @Default(<StudentDetail>[]) List<StudentDetail> students,
    @Default(<StudentDetail>[]) List<StudentDetail> lsCheckin,
    @Default(-1) int noiseLevel,
    @Default(-1) int goodTakeLevel,
    DateTime? selectDate,
    @Default(false) showLoadingIndicator,

  }) = _StudentListState;
}
