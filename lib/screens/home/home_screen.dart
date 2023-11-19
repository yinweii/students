import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:students/generated/assets.gen.dart';

import 'package:students/models/category.dart';
import 'package:students/screens/all_student_info.dart/all_student_info.dart';
import 'package:students/screens/class_list/class_list_screen.dart';
import 'package:students/screens/create_student/create_student.dart';

import 'package:students/screens/home/components/category_item.dart';
import 'package:students/screens/home/home_state_nofitier.dart';
import 'package:students/student_attendance/students_attendance_screen.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';

import 'package:students/utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with Utils, TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController();
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: screenHeight(context) * 0.28,
              padding: const EdgeInsets.only(left: 16),
              decoration: const BoxDecoration(
                color: AppColors.bgNav,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://nofiredrills.com/wp-content/uploads/2016/10/myavatar.png'),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight(context) * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome,',
                          style: TextStyle(
                            color: AppColors.black393939,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          'Mrs. Luna',
                          style: TextStyle(
                            color: AppColors.black1,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          height: 2,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          width: screenWidth(context) * 0.3,
                          decoration: BoxDecoration(
                            color: AppColors.grey969696,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const Text(
                          'English',
                          style: TextStyle(
                            color: AppColors.black393939,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              onTap: (index) {
                log('message: $index');
              },
              padding: EdgeInsets.only(top: screenHeight(context) * 0.3),
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.person,
                  ),
                  text: 'Chính quy',
                ),
                Tab(
                  icon: Icon(
                    Icons.group,
                  ),
                  text: 'Dạy thêm',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),

            Container(
              padding: EdgeInsets.only(top: screenHeight(context) * 0.08),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight(context) * 0.3),
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.86,
                          shrinkWrap: true,
                          children: listCategory
                              .map(
                                (item) => GestureDetector(
                                  onTap: () => _handleOnTap(item.type),
                                  child: CategoryItem(category: item),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () =>
                              push(context, const CreateStudentScreen()),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: SizedBox(
                                height: 56,
                                width: screenWidth(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.svg.icPlus.path,
                                      height: 25,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Thêm học sinh mới',
                                      style: AppTextStyles.defaultBold,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight(context) * 0.3),
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.86,
                          shrinkWrap: true,
                          children: lsOtherClass
                              .map(
                                (item) => GestureDetector(
                                  onTap: () => _handleOnTap(item.type),
                                  child: CategoryItem(category: item),
                                ),
                              )
                              .toList(),
                        ),
                        GestureDetector(
                          onTap: () =>
                              push(context, const CreateStudentScreen()),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: SizedBox(
                                height: 56,
                                width: screenWidth(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.svg.icPlus.path,
                                      height: 25,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Thêm học sinh mới',
                                      style: AppTextStyles.defaultBold,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //   margin: EdgeInsets.only(top: screenHeight(context) * 0.3),
            //   height: double.infinity,
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: GridView.count(
            //     physics: const NeverScrollableScrollPhysics(),
            //     crossAxisCount: 3,
            //     mainAxisSpacing: 30,
            //     crossAxisSpacing: 10,
            //     childAspectRatio: 0.86,
            //     shrinkWrap: true,
            //     children: listCategory
            //         .map(
            //           (item) => SizedBox(
            //             height: 250,
            //             child: GestureDetector(
            //               onTap: () => _handleOnTap(item.type),
            //               child: CategoryItem(category: item),
            //             ),
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _handleOnTap(CategoryType type) {
    switch (type) {
      case CategoryType.checkIn:
        push(context, const StudentAttendance());
        return;
      case CategoryType.checkList:
        push(context, const ClassListScreen());

        break;
      case CategoryType.userInfo:
        push(context, const AllStudentInfoScreen());
        break;
      case CategoryType.myClass:
        break;
      case CategoryType.dayOff:
        break;
      case CategoryType.report:
        break;
    }
  }

  Future<String?> _showTextInputDialog(
    BuildContext context,
    TextEditingController controller,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nhập tên khối'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Nhập thên khối"),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Huỷ"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context, controller.text),
            ),
          ],
        );
      },
    );
  }
}
