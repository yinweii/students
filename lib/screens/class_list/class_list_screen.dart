import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/common_appbar.dart';
import 'package:students/models/class_model.dart';
import 'package:students/screens/class_list/class_list_state_notifier.dart';
import 'package:students/screens/student_list/student_list_screen.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/date_time_util.dart';
import 'package:students/utils/dialog.dart';
import 'package:students/utils/utils.dart';

class ClassListScreen extends ConsumerStatefulWidget {
  final Class? classData;
  const ClassListScreen({super.key, this.classData});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClassListScreenState();
}

class _ClassListScreenState extends ConsumerState<ClassListScreen> with Utils {
  late TextEditingController classNameController;
  late TextEditingController numberController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classNameController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    classNameController
      ..clear()
      ..dispose();
    numberController
      ..clear()
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(classListProvider.notifier);
    final state = ref.watch(classListProvider);
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Danh sách lớp',
        showBackButton: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                final result = await ShowSimpleDialog.displayTextInputDialog(
                  context,
                  classNameController: classNameController,
                  numberController: numberController,
                );
                if (result == null) {
                  return;
                }
                notifier.addClass(result);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text('TỔNG SỐ: ${state.classes.length}',
                style: AppTextStyles.defaultBold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.classes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => push(
                      context,
                      StudentListScreen(
                        classData: state.classes[index],
                      )),
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
                            color: state.classes[index].hashColor?.toColor() ??
                                AppColors.grey969696,
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
                                state.classes[index].className ?? '',
                                style: AppTextStyles.defaultBold.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Last update: ${DateTimeUtil.updateTime(state.classes[index].updateAt ?? '')}',
                                style: AppTextStyles.defaultBold.copyWith(
                                  color: AppColors.black393939,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Tổng số: ${state.classes[index].number}',
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
