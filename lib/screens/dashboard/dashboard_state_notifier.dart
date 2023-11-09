import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/screens/dashboard/dashboard_state.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardStateNotifier, DashboardState>((ref) {
  return DashboardStateNotifier(ref);
});

enum DashboardItem {
  home,
  hour,
  profile,
}

typedef RefreshListener = Future<void> Function();

class DashboardStateNotifier extends StateNotifier<DashboardState> {
  DashboardStateNotifier(this.ref) : super(DashboardState());
  final Ref ref;
  Map<DashboardItem, RefreshListener> listeners = {};

  void notifyRefresh(DashboardItem item) {
    final inProgress = state.inProgress;
    if (inProgress) {
      return;
    }

    state = state.copyWith(inProgress: true);
    listeners[item]?.call().then((_) {
      state = state.copyWith(inProgress: false);
    });

    state = state.copyWith(inProgress: false);
  }

  void addRefreshListener(DashboardItem item, RefreshListener listener) {
    listeners[item] = listener;
  }

  void updateViewAndDashboardIndex({
    required TabController tabController,
    required int indexTab,
  }) {
    // Update Convex index
    tabController.animateTo(indexTab);
    // Update state index tabbar
    state = state.copyWith(
      indexTab: indexTab,
    );
  }
}
