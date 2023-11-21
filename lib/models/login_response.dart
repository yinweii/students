import 'dart:convert';

import 'package:students/models/app_user.dart';

class LogInData {
  final String? token;
  final AppUser? appUser;
  LogInData({
    this.token,
    this.appUser,
  });

  LogInData copyWith({
    String? token,
    AppUser? appUser,
  }) {
    return LogInData(
      token: token ?? this.token,
      appUser: appUser ?? this.appUser,
    );
  }

  factory LogInData.fromMap(Map<String, dynamic> map) {
    return LogInData(
      token: map['access_token'],
      appUser: map['user'] != null ? AppUser.fromMap(map['user']) : null,
    );
  }

  factory LogInData.fromJson(String source) =>
      LogInData.fromMap(json.decode(source));

  @override
  String toString() => 'LogInData(token: $token, appUser: $appUser)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LogInData &&
        other.token == token &&
        other.appUser == appUser;
  }

  @override
  int get hashCode => token.hashCode ^ appUser.hashCode;
}
