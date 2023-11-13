import 'dart:ui';

import 'package:students/generated/assets.gen.dart';
import 'package:students/utils/app_colors.dart';

class Category {
  final String name;
  final String icon;
  final Color color;
  final CategoryType type;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.type,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.name == name &&
        other.icon == icon &&
        other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode ^ color.hashCode;
}

List<Category> listCategory = [
  // Category(
  //   name: 'Điểm danh',
  //   icon: Assets.svg.icCheckIn.path,
  //   color: AppColors.bgNav,
  //   type: CategoryType.checkIn,
  // ),
  Category(
    name: 'Danh sách',
    icon: Assets.svg.icCheckList.path,
    color: AppColors.purpleB299F2,
    type: CategoryType.checkList,
  ),
  Category(
      name: 'Thông tin học sinh',
      icon: Assets.svg.icUserInfo.path,
      color: AppColors.blueAFE1F2,
      type: CategoryType.userInfo),
  // Category(
  //   name: 'Lớp của tôi',
  //   icon: Assets.svg.icMyClass.path,
  //   color: AppColors.orangeEFD19B,
  //   type: CategoryType.myClass,
  // ),
  // Category(
  //   name: 'Xin nghỉ',
  //   icon: Assets.svg.icDayOff.path,
  //   color: AppColors.melonColor,
  //   type: CategoryType.dayOff,
  // ),
  Category(
    name: 'Báo cáo',
    icon: Assets.svg.icReport.path,
    color: AppColors.bgNav,
    type: CategoryType.report,
  ),
];

List<Category> lsOtherClass = [
  Category(
    name: 'Điểm danh',
    icon: Assets.svg.icCheckIn.path,
    color: AppColors.bgNav,
    type: CategoryType.checkIn,
  ),
  Category(
    name: 'Danh sách',
    icon: Assets.svg.icCheckList.path,
    color: AppColors.purpleB299F2,
    type: CategoryType.checkList,
  ),
  Category(
    name: 'Thông tin học sinh',
    icon: Assets.svg.icUserInfo.path,
    color: AppColors.blueAFE1F2,
    type: CategoryType.userInfo,
  ),
];

enum CategoryType {
  checkIn,
  checkList,
  userInfo,
  myClass,
  dayOff,
  report,
}
