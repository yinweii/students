import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/models/task_model.dart';
import 'package:students/screens/dashboard/dashboard_state_notifier.dart';
import 'package:students/screens/home/home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(ref);
});

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier(this.ref) : super(HomeState()) {
    ref
        .read(dashboardNotifierProvider.notifier)
        .addRefreshListener(DashboardItem.home, _fetchAllTasks);

    _fetchAllTasks();
  }

  final Ref ref;

  void onSuccess(Task taskId) {
    final list = state.lsTask.toList();
    final indexOfTask = list.indexWhere((element) => element == taskId);
    final currentStatus = list[indexOfTask].success;

    list[indexOfTask] =
        state.lsTask[indexOfTask].copyWith(success: !currentStatus);

    state = state.copyWith(lsTask: list);
  }

  Future<void> onNewData() async {
    await _fetchAllTasks();
  }

  Future<void> _fetchAllTasks() async {
    state = state.copyWith(loadingIndicator: true);
    try {
      final result = await apiClient(ref).getRequest(
        ApiEndpoints.tasks,
        isAuthorized: true,
      );
      if (result is! ApiResponse || !result.success) {
        state = state.copyWith(loadingIndicator: false);
        return;
      }
      final lsTask = result.data['tasks'] as List<dynamic>;
      final tasks = lsTask.map((e) => Task.fromMap(e)).toList();
      state = state.copyWith(lsTask: tasks, loadingIndicator: false);
    } catch (e) {
      print(e.toString());
      state = state.copyWith(loadingIndicator: false);
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await apiClient(ref).deleteRequest(
        '${ApiEndpoints.tasks}/$id',
      );
      final exitIndex = state.lsTask.indexWhere((element) => element.id == id);
      state.lsTask.toList().removeAt(exitIndex);

      state = state.copyWith(lsTask: state.lsTask);
    } catch (e) {
      print(e.toString());
    }
  }
}
