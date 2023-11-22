import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/api/network_resource_state/network_resource_state.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/common/core/session/session_state_notifier.dart';
import 'package:students/screens/login/login_state.dart';
import 'package:students/models/login_response.dart';
import 'package:students/utils/dialog.dart';
import 'package:students/utils/utils.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier(ref);
});

class LoginStateNotifier extends StateNotifier<LoginState> with Utils {
  LoginStateNotifier(this.ref) : super(LoginState());

  Ref ref;

  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final result = await _callApiLogin(email, password);

    result.when(
      (data) async {
        if (data is Map) {
          final result = LogInData.fromMap(data as Map<String, dynamic>);
          await ref.read(sessionProvider.notifier).saveSession(
                token: result.token!,
                appUser: result.appUser,
              );

          await pushReplacementNamed(Routes.homeScreen);
        }
      },
      loading: () {},
      error: (error) {
        Dialogs(context).showError(error.toString());
      },
    );
  }

  Future<NetworkResourceState> _callApiLogin(
    String email,
    String password,
  ) async {
    final params = {'email': email, 'password': password};
    try {
      final result = await apiClient(ref).postRequest(
        ApiEndpoints.login,
        params: params,
      );
      if (result is! ApiResponse || !result.success) {
        return const NetworkResourceState.error('Something errors :(');
      }

      return NetworkResourceState(result.data);
    } catch (e) {
      NetworkResourceState.error(e.toString());
    }

    return const NetworkResourceState.error('Something errors :(');
  }
}
