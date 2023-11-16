import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_list_state.freezed.dart';


@freezed
class ClassListState with _$ClassListState {

  factory ClassListState({
    String? name,
  }) = _ClassListState;

 
}