
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/utils.dart';

class StudentList extends ConsumerWidget with Utils {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: screenHeight(context) * 0.55,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        itemCount: 20,
        shrinkWrap: true,
        // The list items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hoang Van $index',
                  style: AppTextStyles.defaultRegular400.copyWith(
                    fontSize: 17,
                  ),
                ),
                const Icon(Icons.chevron_right)
              ],
            ),
          );
        },
        // The separators
        separatorBuilder: (context, index) {
          return const Divider(
            color: AppColors.grey969696,
          );
        },
      ),
    );
  }
}
