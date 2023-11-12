import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/utils.dart';

class StudentItem extends ConsumerWidget with Utils {
  const StudentItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.purpleF2EEFC,
                backgroundImage: NetworkImage(
                    'https://robohash.org/user/${Random().nextInt(20)}'),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyễn Văn A',
                    style: AppTextStyles.defaultBold,
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: screenWidth(context) * 0.4,
                    child: Wrap(
                      runSpacing: 2,
                      children: List.generate(
                        10,
                        (index) => Icon(
                          index < 6
                              ? Icons.radio_button_checked_rounded
                              : Icons.radio_button_unchecked,
                          size: 16,
                          color: AppColors.bgNav,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Tổng: 6/10',
                    style: AppTextStyles.defaulLato.copyWith(
                      color: AppColors.black393939,
                    ),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: Text(
              'Lớp: 10A1',
              style: AppTextStyles.defaultMedium.copyWith(
                color: AppColors.black393939,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
