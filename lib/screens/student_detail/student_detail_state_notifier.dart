import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/api/network_resource_state/network_resource_state.dart';
import 'package:students/models/student_detail.dart';
import 'package:students/screens/student_detail/student_deatil_state.dart';

final studentDetailProvider = StateNotifierProvider.family
    .autoDispose<StudentDetailStateNotifier, StudentDetailState, String?>(
        (ref, id) {
  return StudentDetailStateNotifier(ref, id);
});

class StudentDetailStateNotifier extends StateNotifier<StudentDetailState> {
  StudentDetailStateNotifier(this.ref, this.id) : super(StudentDetailState()) {
    studentDetail();
  }

  Ref ref;
  final String? id;

  Future<void> studentDetail() async {
    try {
      state =
          state.copyWith(studentDetail: const NetworkResourceState.loading());
      final result = await apiClient(ref).getRequest(
        '${ApiEndpoints.student}/$id',
        isAuthorized: true,
      );
      if (result is! ApiResponse || !result.success) {
        return;
      }
      final studentDetail =
          StudentDetail.fromMap(result.data as Map<String, dynamic>);
      state = state.copyWith(
          studentDetail: NetworkResourceState(studentDetail),
          student: studentDetail);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(
          studentDetail: NetworkResourceState.error(e.toString()));
    } finally {}
  }

  Future<void> deleteStudent() async {
    try {
      final result = await apiClient(ref).deleteRequest(
        '${ApiEndpoints.student}/$id',
      );
      if (result is! ApiResponse || !result.success) {
        return;
      }
    } catch (e) {
      log(e.toString());
    } finally {}
  }
}
