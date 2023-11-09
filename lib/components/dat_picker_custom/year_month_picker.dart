import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/dat_picker_custom/date_picker.dart';

import 'package:students/utils/utils.dart';

class YearMonthPicker extends ConsumerWidget with Utils {
  const YearMonthPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      height: MediaQuery.of(context).copyWith().size.height / 3,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    final month = ref.watch(monthProvider);
                    final year = ref.watch(yearProvider);

                    final data = PickerData(month: month, year: year);
                    Navigator.pop(
                      context,
                      data,
                    );
                  },
                  child: const Text('Done')),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: screenHeight(context) * 0.25,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: DatePickerCustom(
                    input: Util.listYear(),
                  ),
                ),
                Expanded(
                  child: DatePickerCustom(
                    input: Util.listMonth(),
                    typePicker: TypePicker.month,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
