import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:students/components/common_appbar.dart';
import 'package:students/screens/student_detail/student_detail.dart';
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
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Tìm học sinh',
        showBackButton: true,
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: TextField(
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
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),

        //     ListView.builder(
        //   itemCount: 3,
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     return GestureDetector(
        //       onTap: () => push(context, const StudentDetailScreen()),
        //       child: Container(
        //         margin: const EdgeInsets.all(8),
        //         height: screenHeight(context) * 0.12,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8),
        //           border: Border.all(color: Colors.grey),
        //         ),
        //         child: Stack(
        //           children: [
        //             Column(
        //               children: [
        //                 Row(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     const Padding(
        //                       padding: EdgeInsets.only(left: 8, top: 8),
        //                       child: CircleAvatar(
        //                         radius: 24,
        //                         backgroundColor: Colors.grey,
        //                         backgroundImage: NetworkImage(
        //                             'https://robohash.org/YGY.png?set=set1&size=150x150'),
        //                       ),
        //                     ),
        //                     const SizedBox(width: 16),
        //                     Padding(
        //                       padding: const EdgeInsets.only(top: 16),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           SizedBox(
        //                             width: screenWidth(context) * 0.76,
        //                             child: Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 Expanded(
        //                                   flex: 2,
        //                                   child: Row(
        //                                     children: [
        //                                       Text(
        //                                         results[index].name ?? '',
        //                                         style: AppTextStyles.defaultBold,
        //                                       ),
        //                                       const SizedBox(width: 6),
        //                                       SvgPicture.asset(
        //                                         results[index].gender == 'Male'
        //                                             ? Assets.svg.icMale.path
        //                                             : Assets.svg.icFemale.path,
        //                                         width: 16,
        //                                         height: 16,
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ),
        //                                 const SizedBox(
        //                                   width: 30,
        //                                 ),
        //                                 Text(
        //                                     'Lớp: ${results[index].classInfo.className}')
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Expanded(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(top: 16),
        //                     child: LinearPercentIndicator(
        //                       width: 150.0,
        //                       animation: true,
        //                       animationDuration: 1000,
        //                       lineHeight: 15.0,
        //                       percent: 0.2,
        //                       center: const Text(' 2/10'),
        //                       progressColor: Colors.red,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Positioned(
        //               right: 10,
        //               bottom: 8,
        //               child: GestureDetector(
        //                 onTap: () async {
        //                   await ShowSimpleDialog.topShowGeneralDialog(context,
        //                       childWidget: const PointForm());
        //                 },
        //                 child: const Icon(
        //                   Icons.brush_outlined,
        //                   color: AppColors.grey969696,
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ]),
    );
  }
}
