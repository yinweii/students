import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/common_appbar.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/models/point.dart';
import 'package:students/models/student.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/date_time_util.dart';
import 'package:students/utils/utils.dart';
import 'package:grouped_list/grouped_list.dart';

class StudentDetailScreen extends ConsumerWidget with Utils {
  const StudentDetailScreen({super.key, this.student});
  final Student? student;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Chi tiết',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
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
                    backgroundImage: AssetImage(student?.gender == 'Male'
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
                        'Giới tính:  ${student?.gender}',
                        style: AppTextStyles.defaultMedium,
                      ),
                      Text(
                        'Lớp: 12A1',
                        style: AppTextStyles.defaultMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildInfo(title: 'Số điện thoại', content: '034456676'),
            const Divider(),
            _buildInfo(title: 'Ngày sinh: ', content: '01/01/2000'),
            const Divider(),
            _buildInfo(title: 'Phụ huynh', content: 'Nguyen Van B'),
            const Divider(),
            _buildInfo(title: 'Sdt: ', content: '034456676'),
            const Divider(),
            _buildInfo(
                title: 'Địa chỉ',
                content: ' 123/3/5B đường Lê Lợi ,Nam Từ Liêm, Hà Nội'),
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
              elements: [],
              groupBy: (element) => element.createAt ?? '',
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1.createAt!.compareTo(item2.createAt!),
              order: GroupedListOrder.ASC,
              useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  DateTimeUtil.fromatDate(DateTime.parse(value)),
                  textAlign: TextAlign.start,
                  style: AppTextStyles.defaultBold,
                ),
              ),
              itemBuilder: (c, element) {
                return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thuộc bài: Tốt',
                        style: AppTextStyles.defaultMedium,
                      ),
                      const Divider(),
                      Text(
                        'Thế bấm: Tốt',
                        style: AppTextStyles.defaultMedium,
                      ),
                      const Divider(),
                      Text(
                        'Nhịp phách: Tốt',
                        style: AppTextStyles.defaultMedium,
                      ),
                      const Divider(),
                      Text(
                        'Mất trật tự: ',
                        style: AppTextStyles.defaultMedium,
                      ),
                      const Divider(),
                      Text(
                        'Chăm ngoan: ',
                        style: AppTextStyles.defaultMedium,
                      ),
                      const Divider(),
                      Text(
                        'Nhận xét: Tốt cố gắng phát huy',
                        style: AppTextStyles.defaultMedium,
                      ),
                      const Divider(),
                    ],
                  )),
                );
              },
            ),
          ],
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
