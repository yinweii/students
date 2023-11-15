import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/screens/student_list/student_list_screen.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/utils.dart';

class ClassListScreen extends ConsumerWidget with Utils {
  const ClassListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách lớp',
          style: AppTextStyles.defaultBold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text('TỔNG SỐ: 6', style: AppTextStyles.defaultBold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => push(context, const StudentListScreen()),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: screenHeight(context) * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.grey969696),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(Random().nextInt(0xffffffff))
                                .withAlpha(0xff),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Lớp 1A',
                                style: AppTextStyles.defaultBold.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Last update: 12/12/2022',
                                style: AppTextStyles.defaultBold.copyWith(
                                  color: AppColors.black393939,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Sĩ số: 30',
                                style: AppTextStyles.defaultBold.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ],
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
