import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';

import 'package:students/screens/home/home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(ref);
});

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier(this.ref) : super(HomeState()) {
    // ref
    //     .read(dashboardNotifierProvider.notifier)
    //     .addRefreshListener(DashboardItem.home, (_) {});
  }

  final Ref ref;

  

}
