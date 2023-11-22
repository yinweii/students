import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/models/class_model.dart';
import 'package:students/screens/create_student/create_student_state_notifier.dart';

part 'create_student_state.freezed.dart';

@freezed
class CreateStudentState with _$CreateStudentState {
  factory CreateStudentState({
    @Default(<Class>[]) List<Class> classes,
    @Default(false) showLoadingIndicator,
    ClassType? classType,
    Class? onSelectClass,
    @Default(Gender.male) Gender selectGender,
    DateTime? selectDatetime,
  }) = _CreateStudentState;
}
