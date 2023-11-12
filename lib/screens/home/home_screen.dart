import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:students/models/category.dart';
import 'package:students/screens/create_student/create_student.dart';

import 'package:students/screens/home/components/category_item.dart';
import 'package:students/screens/home/home_state_nofitier.dart';
import 'package:students/student_attendance/students_attendance_screen.dart';
import 'package:students/utils/app_colors.dart';

import 'package:students/utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with Utils {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);
    return Scaffold(
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
                      'https://anhgaixinh.vn/wp-content/uploads/2022/12/anh-dep-co-gai.jpg'),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: screenHeight(context) * 0.1,
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
                        'Mr. Dyan',
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
          Container(
            margin: EdgeInsets.only(top: screenHeight(context) * 0.3),
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 10,
              childAspectRatio: 0.86,
              shrinkWrap: true,
              children: listCategory
                  .map(
                    (item) => SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => _handleOnTap(item.type),
                        child: CategoryItem(category: item),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _handleOnTap(CategoryType type) {
    switch (type) {
      case CategoryType.checkIn:
        push(context, const StudentAttendance());
        return;
      case CategoryType.checkList:
        push(context, const CreateStudentScreen());

        break;
      case CategoryType.userInfo:
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
