import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/models/student_detail.dart';
import 'package:students/screens/all_student_info.dart/all_student_state.dart';

final allStudentProvider =
    StateNotifierProvider<AllStudentStateNotifier, AllStudentState>((ref) {
  return AllStudentStateNotifier(ref);
});

class AllStudentStateNotifier extends StateNotifier<AllStudentState> {
  AllStudentStateNotifier(this.ref) : super(AllStudentState());

  Ref ref;

  Future<void> searchStudent(String search) async {
    try {
      state = state.copyWith(loadingIndicator: true);
      final result = await apiClient(ref).getRequest(
        '${ApiEndpoints.student}?name=$search',
        isAuthorized: true,
      );
      if (result is! ApiResponse || !result.success) {
        state = state.copyWith(lsStudent: []);
        return;
      }
      final students = (result.data as List)
          .map((e) => StudentDetail.fromMap(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(lsStudent: students, loadingIndicator: false);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(lsStudent: [], loadingIndicator: false);
    }
  }
}
