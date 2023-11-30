import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_state.freezed.dart';


@freezed
class CheckInState with _$CheckInState {

  factory CheckInState({
    String? id,
  }) = _CheckInState;


}