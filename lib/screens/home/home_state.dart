import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/models/grade.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) success,
    @Default(false) loadingIndicator,
    @Default(<Grade>[]) List<Grade> lsGrade,
  }) = _HomeState;
}
