import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:students/components/common_appbar.dart';
import 'package:students/components/error_indicator.dart';
import 'package:students/components/loading_indicator.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/models/point.dart';
import 'package:students/screens/create_student/create_student_screen.dart';
import 'package:students/screens/student_detail/student_detail_state_notifier.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/date_time_util.dart';
import 'package:students/utils/utils.dart';
import 'package:grouped_list/grouped_list.dart';

class StudentDetailScreen extends ConsumerWidget with Utils {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ModalRoute.of(context)?.settings.arguments as String?;

    final notifier = ref.watch(studentDetailProvider(id).notifier);
    final state = ref.watch(studentDetailProvider(id));
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Chi tiết',
        showBackButton: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                final result = await push(
                  context,
                  CreateStudentScreen(
                    student: state.student,
                  ),
                  settings: RouteSettings(
                    arguments: state.student,
                  ),
                );
                if (result == null) {
                  return;
                }
                await notifier.studentDetail();
              },
              child: const Icon(
                Icons.edit_note_rounded,
                size: 35,
                color: AppColors.primaryBtn,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: SvgPicture.asset(
              Assets.svg.icDelete.path,
              colorFilter: const ColorFilter.mode(
                AppColors.melonColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: state.studentDetail.map(
        (value) {
          final student = value.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.bgNav,
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(student?.gender == 'male'
                            ? Assets.images.icMale1.path
                            : Assets.images.icFemale1.path),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student?.name ?? '',
                            style: AppTextStyles.defaultBold,
                          ),
                          Text(
                            'Giới tính:  ${student?.gender == 'male' ? 'Nam' : 'Nữ'}',
                            style: AppTextStyles.defaultMedium,
                          ),
                          Text(
                            'Lớp: ${student?.classInfo?.name}',
                            style: AppTextStyles.defaultMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildInfo(title: 'Số điện thoại', content: student?.phone),
                const Divider(),
                _buildInfo(
                    title: 'Ngày sinh: ',
                    content: DateTimeUtil.updateTime(student?.dob)),
                const Divider(),
                _buildInfo(title: 'Phụ huynh', content: student?.mainContract),
                const Divider(),
                _buildInfo(title: 'Sdt: ', content: student?.mainContractPhone),
                const Divider(),
                _buildInfo(title: 'Địa chỉ', content: student?.address),
                Container(
                  margin: const EdgeInsets.all(16),
                  height: 56,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(color: AppColors.primaryBtn),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Thông tin điểm số',
                      style: AppTextStyles.defaultBold,
                    ),
                  ),
                ),
                GroupedListView<StudentPoint, String>(
                  shrinkWrap: true,
                  elements: student?.points ?? [],
                  groupBy: (element) => element.createdAt ?? '',
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1.createdAt!.compareTo(item2.createdAt!),
                  order: GroupedListOrder.ASC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      DateTimeUtil.fromatDate(DateTime.parse(value)),
                      textAlign: TextAlign.start,
                      style: AppTextStyles.defaultBold,
                    ),
                  ),
                  itemBuilder: (c, element) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thuộc bài: ${element.speech}',
                                style: AppTextStyles.defaultMedium,
                              ),
                              const Divider(),
                              Text(
                                'Thế bấm: ${element.pressPosition}',
                                style: AppTextStyles.defaultMedium,
                              ),
                              const Divider(),
                              Text(
                                'Nhịp phách: ${element.beats}',
                                style: AppTextStyles.defaultMedium,
                              ),
                              const Divider(),
                              Text(
                                'Mất trật tự: ${element.noise}',
                                style: AppTextStyles.defaultMedium,
                              ),
                              const Divider(),
                              Text(
                                'Chăm ngoan: ${element.goodTake}',
                                style: AppTextStyles.defaultMedium,
                              ),
                              const Divider(),
                              Text(
                                'Nhận xét: ${element.note}',
                                style: AppTextStyles.defaultMedium,
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ],
            ),
          );
        },
        loading: (_) => const LoadingIndicator(),
        error: (e) => CommonErrorIndicator(
          message: e.toString(),
        ),
      ),
    );
  }

  Widget _buildInfo({String? title, String? content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title ?? '',
              style: AppTextStyles.defaultBold.copyWith(fontSize: 18),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              content ?? '',
              style: AppTextStyles.defaultFont.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
