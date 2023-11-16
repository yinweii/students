import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/utils.dart';

class StudentDetailScreen extends ConsumerWidget with Utils {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
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
                    backgroundImage: AssetImage(Assets.images.icMale1.path),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hoang Van A',
                        style: AppTextStyles.defaultBold,
                      ),
                      Text(
                        'Giới tính: Nam',
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
