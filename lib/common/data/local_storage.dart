import 'dart:convert';

import 'package:students/models/app_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();
  static const _keyAppUser = 'app_user';

  static Future<void> saveAppUser(AppUser? appUser) async {
    final prefs = await SharedPreferences.getInstance();
    final value = jsonEncode(appUser?.toJson());
    await prefs.setString(_keyAppUser, value);
  }

  /// Get - Save User Detail
  static Future<AppUser?> getUserDetail() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_keyAppUser);

    if (value == null || value.isEmpty) {
      return null;
    }

    final map = jsonDecode(value) as Map<String, dynamic>;
    return AppUser.fromMap(map);
  }
}
