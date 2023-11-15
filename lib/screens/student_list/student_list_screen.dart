import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:students/components/common_button.dart';
import 'package:students/screens/student_list/components/point_form.dart';
import 'package:students/screens/student_list/components/search_student.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/dialog.dart';
import 'package:students/utils/utils.dart';

class StudentListScreen extends ConsumerWidget with Utils {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách',
          style: AppTextStyles.defaultBold,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: CommonButton(
          label: 'Thêm học sinh',
          height: 56,
          onTap: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: screenHeight(context) * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8, top: 8),
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(
                                        'https://robohash.org/YGY.png?set=set1&size=150x150'),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth(context) * 0.76,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                'Nguyễn Văn A',
                                                style:
                                                    AppTextStyles.defaultBold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            const Icon(
                                              Icons.radio_button_unchecked,
                                              size: 25,
                                              color: AppColors.bgNav,
                                            ),
                                            // const Icon(Icons.radio_button_unchecked),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: LinearPercentIndicator(
                                  width: 150.0,
                                  animation: true,
                                  animationDuration: 1000,
                                  lineHeight: 15.0,
                                  percent: 0.2,
                                  center: const Text("20.0%"),
                                  linearStrokeCap: LinearStrokeCap.butt,
                                  progressColor: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 10,
                          bottom: 8,
                          child: GestureDetector(
                            onTap: () async {
                              await ShowSimpleDialog.topShowGeneralDialog(
                                  context,
                                  childWidget: const PointForm());
                            },
                            child: const Icon(
                              Icons.brush_outlined,
                              color: AppColors.grey969696,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
