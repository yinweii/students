import 'package:flutter/material.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.label,
    this.onTap,
    this.height = 44,
    this.width,
    this.bgColor = AppColors.primaryBtn,
  });
  final String? label;
  final VoidCallback? onTap;
  final Color bgColor;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
            backgroundColor: bgColor,
          ),
          onPressed: onTap,
          child: Text(
            label ?? '',
            style: AppTextStyles.defaultMedium.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
