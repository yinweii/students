import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:students/api/network_resource_state/network_resource_state.dart';
import 'package:students/models/class_model.dart';

part 'class_list_state.freezed.dart';

@freezed
class ClassListState with _$ClassListState {
  factory ClassListState({
    String? name,
    @Default(<Class>[]) List<Class> classes,
    @Default(false) showLoadingIndicator,
    @Default(NetworkResourceState.loading())
    NetworkResourceState<List<Class>?> lsClass,
  }) = _ClassListState;
}
