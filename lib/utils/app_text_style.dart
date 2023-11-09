import 'package:flutter/material.dart';
import 'package:students/utils/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const double fontSize_10 = 10;
  static const double fontSize_11 = 11;
  static const double fontSize_12 = 12;
  static const double fontSize_13 = 13;
  static const double fontSize_14 = 14;
  static const double fontSize_15 = 15;
  static const double fontSize_16 = 16;
  static const double fontSize_18 = 18;
  static const double fontSize_20 = 20;
  static const double fontSize_24 = 24;
  static const double fontSize_28 = 28;
  static const double fontSize_29 = 29;

  static TextStyle defaultRegular400 = const TextStyle(
    fontSize: fontSize_16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle defaulLato = const TextStyle(
    fontSize: fontSize_16,
    color: AppColors.black1,
    fontWeight: FontWeight.w400,
  );
  static TextStyle defaultMedium = const TextStyle(
    fontSize: fontSize_16,
    color: AppColors.black1,
    fontWeight: FontWeight.w400,
  );

  static TextStyle defaultFont = const TextStyle(
    fontSize: fontSize_12,
    color: AppColors.black1,
    fontWeight: FontWeight.w300,
  );

  static TextStyle defaultBold = const TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.black1,
    fontSize: fontSize_16,
  );

  static TextStyle defaultBoldAppBar = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: fontSize_20,
    color: AppColors.black1,
  );
}
