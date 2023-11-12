import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/screens/class/components/list_student.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';

class ClassScreen extends ConsumerStatefulWidget {
  const ClassScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClassScreenState();
}

class _ClassScreenState extends ConsumerState<ClassScreen> {
  String? selectedValue;
  final grade = ['Khối 6', 'Khối 7', 'Khối 8', 'Khối 9'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Danh sách học sinh',
          style: AppTextStyles.defaultMedium.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: AppColors.grey969696,
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: selectedValue,
                      isExpanded: true,
                      onChanged: (String? newValue) =>
                          setState(() => selectedValue = newValue),
                      items: grade
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: AppColors.grey969696,
                        ),
                        borderRadius: BorderRadius.circular(10)),

                    // dropdown below..
                    child: DropdownButton<String>(
                      value: selectedValue,
                      isExpanded: true,
                      onChanged: (String? newValue) =>
                          setState(() => selectedValue = newValue),
                      items: grade
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const StudentList()
          ],
        ),
      ),
    );
  }
}
