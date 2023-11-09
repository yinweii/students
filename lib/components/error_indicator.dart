import 'package:flutter/material.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';

class CommonErrorIndicator extends StatelessWidget {
  const CommonErrorIndicator({
    Key? key,
    this.message,
    this.onTapRetry,
  }) : super(key: key);
  final String? message;
  final VoidCallback? onTapRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? 'Errors',
            style: AppTextStyles.defaulLato,
          ),
          onTapRetry != null
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple2E1470,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  onPressed: onTapRetry,
                  child: Text(
                    'Retry',
                    style: AppTextStyles.defaulLato.copyWith(
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
