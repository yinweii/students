import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/models/task_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) success,
    @Default(false) loadingIndicator,
    @Default(<Task>[]) List<Task> lsTask,
  }) = _HomeState;
}
