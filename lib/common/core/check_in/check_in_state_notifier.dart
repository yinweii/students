import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/common/core/check_in/check_in_state.dart';
import 'package:students/models/checkin.dart';

final checkinProvider =
    StateNotifierProvider<CheckInStateNotifier, CheckInState>((ref) {
  return CheckInStateNotifier(ref);
});

class CheckInStateNotifier extends StateNotifier<CheckInState> {
  CheckInStateNotifier(this.ref) : super(CheckInState());

  Ref ref;

  Future<CheckIn?> checkin({
    required int classId,
    required int studentId,
    String? checkinTime,
  }) async {
    try {
      final result = await apiClient(ref).postRequest(
        ApiEndpoints.checkIn,
        isAuthorized: true,
        params: {
          'student_id': studentId,
          'class_id': classId,
          'checkin_time': checkinTime,
        },
      );
      if (result is! ApiResponse || !result.success) {
        return null;
      }
      final checkin = CheckIn.fromMap(result.data as Map<String, dynamic>);
      return checkin;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> unCheck(int id) async {
    try {
      final result = await apiClient(ref).deleteRequest(
        '${ApiEndpoints.checkIn}/$id',
      );
      if (result is! ApiResponse || !result.success) {
        return false;
      }
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
