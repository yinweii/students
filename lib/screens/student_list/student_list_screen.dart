import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:students/components/common_appbar.dart';

import 'package:students/generated/assets.gen.dart';

import 'package:students/models/class_model.dart';

import 'package:students/screens/student_detail/student_detail_screen.dart';
import 'package:students/screens/student_list/components/point_form.dart';
import 'package:students/screens/student_list/components/search_student.dart';
import 'package:students/screens/student_list/student_list_state_notifier.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/date_time_util.dart';
import 'package:students/utils/datetime_extention.dart';
import 'package:students/utils/dialog.dart';
import 'package:students/utils/utils.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import 'package:collection/collection.dart';

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
                delegate: CustomSearchDelegate(
                  students: state.students,
                ),
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
      body: RefreshIndicator(
        onRefresh: () async => await notifier.getAllStudent(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Ngày:',
                    style: AppTextStyles.defaultMedium,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    DateTimeUtil.fromatDate(state.selectDate ?? DateTime.now()),
                    style: AppTextStyles.defaultMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      final newDateTime = await showRoundedDatePicker(
                        height: screenHeight(context) * 0.36,
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 50),
                        lastDate: DateTime(DateTime.now().year + 1),
                        borderRadius: 16,
                      );
                      if (newDateTime == null) {
                        return;
                      }
                      notifier.onSelectedDate(newDateTime);
                    },
                    child: SvgPicture.asset(Assets.svg.icAddCalender.path),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Tổng số: ${state.students.length}',
                    style: AppTextStyles.defaultMedium,
                  ),
                  const Spacer(),
                  Text('Đã điểm danh: ${state.lsCheckin.length}',
                      style: AppTextStyles.defaultMedium),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.students.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final isCheckIn =
                      ((state.students[index].checkin ?? [])).firstWhereOrNull(
                    (element) => DateTime.parse(
                            element.checkinTime ?? element.createdAt ?? '')
                        .isSameDay(state.selectDate ?? DateTime.now()),
                  );

                  return GestureDetector(
                    onTap: () => push(context, const StudentDetailScreen(),
                        settings: RouteSettings(
                          arguments: state.students[index].id,
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
                                      backgroundImage: AssetImage(
                                        state.students[index].gender == 'male'
                                            ? Assets.images.icMale1.path
                                            : Assets.images.icFemale1.path,
                                      ),
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
                                                              'male'
                                                          ? Assets
                                                              .svg.icMale.path
                                                          : Assets.svg.icFemale
                                                              .path,
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
                                                onTap: () async {
                                                  if (isCheckIn == null) {
                                                    await notifier.onCheckIn(
                                                        state.students[index]);
                                                    return;
                                                  }
                                                  await notifier
                                                      .onUnCheckIn(isCheckIn);
                                                },
                                                child: Icon(
                                                  isCheckIn != null
                                                      ? Icons
                                                          .radio_button_checked
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
                                  ),
                                );
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
      ),
    );
  }
}
