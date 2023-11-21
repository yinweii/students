import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:students/components/common_appbar.dart';

import 'package:students/generated/assets.gen.dart';

import 'package:students/models/class_model.dart';

import 'package:students/screens/student_detail/student_detail.dart';
import 'package:students/screens/student_list/components/point_form.dart';
import 'package:students/screens/student_list/components/search_student.dart';
import 'package:students/screens/student_list/student_list_state_notifier.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/dialog.dart';
import 'package:students/utils/utils.dart';

class StudentListScreen extends ConsumerWidget with Utils {
  final Class? classData;
  const StudentListScreen({super.key, this.classData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(studentLsitProvider(classData));
    final notifier = ref.read(studentLsitProvider(classData).notifier);
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Danh sách(${classData?.name})',
        showBackButton: true,
        actions: [
          GestureDetector(
            onTap: () async {
              await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.students.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => push(
                      context,
                      StudentDetailScreen(
                        student: state.students[index],
                      )),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 8),
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(
                                        'https://robohash.org/student/${Random().nextInt(20)}'),
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
                                              child: Row(
                                                children: [
                                                  Text(
                                                    state.students[index]
                                                            .name ??
                                                        '',
                                                    style: AppTextStyles
                                                        .defaultBold,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  SvgPicture.asset(
                                                    state.students[index]
                                                                .gender ==
                                                            'Male'
                                                        ? Assets.svg.icMale.path
                                                        : Assets
                                                            .svg.icFemale.path,
                                                    width: 16,
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            GestureDetector(
                                              onTap: () => notifier.onCheckIn(
                                                  state.students[index]),
                                              child: Icon(
                                                state.lsCheckin.contains(
                                                        state.students[index])
                                                    ? Icons.radio_button_checked
                                                    : Icons
                                                        .radio_button_unchecked,
                                                size: 25,
                                                color: AppColors.bgNav,
                                              ),
                                            ),
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
                                  percent: state.lsCheckin
                                          .contains(state.students[index])
                                      ? 0.3
                                      : 0.2,
                                  center: Text(state.lsCheckin
                                          .contains(state.students[index])
                                      ? '3/10'
                                      : ' 2/10'),
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
                                  childWidget: PointForm(
                                    student: state.students[index],
                                  ));
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
