import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:students/components/common_appbar.dart';
import 'package:students/components/loading_indicator.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/screens/all_student_info.dart/al_student_state_notifier.dart';
import 'package:students/screens/student_detail/student_detail_screen.dart';
import 'package:students/screens/student_list/components/point_form.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/dialog.dart';
import 'package:students/utils/utils.dart';

class AllStudentInfoScreen extends ConsumerStatefulWidget {
  const AllStudentInfoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllStudentInfoScreenState();
}

class _AllStudentInfoScreenState extends ConsumerState<AllStudentInfoScreen>
    with Utils {
  final TextEditingController _searchController = TextEditingController();
  final String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(allStudentProvider);
    final notifier = ref.read(allStudentProvider.notifier);
    return Scaffold(
        appBar: CommonAppbar(
          title: 'Tìm học sinh',
          showBackButton: true,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextField(
                onSubmitted: (String? value) async {
                  await notifier.searchStudent(value ?? '');
                },
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Tên học sinh',
                  prefixIcon: const Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.bgNav),
                  ),
                  focusColor: AppColors.bgNav,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: state.lsStudent.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                      state.lsStudent[index].gender == 'male'
                          ? Assets.images.icMale1.path
                          : Assets.images.icFemale1.path,
                    )),
                    onTap: () async {
                      final result = await push(
                        context,
                        const StudentDetailScreen(),
                        settings: RouteSettings(
                          arguments: state.lsStudent[index].id,
                        ),
                      );
                      if (result == null) {
                        return;
                      }
                      await notifier.searchStudent(_searchQuery);
                    },
                    title: Text(
                      state.lsStudent[index].name ?? '',
                      style: AppTextStyles.defaultBold,
                    ),
                    subtitle: Text(
                      state.lsStudent[index].classInfo?.name ?? '',
                      style: AppTextStyles.defaultMedium,
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
