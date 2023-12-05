import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/models/student_detail.dart';
import 'package:students/screens/student_detail/student_detail_screen.dart';
import 'package:students/screens/student_list/components/point_form.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/dialog.dart';
import 'package:students/utils/utils.dart';

class CustomSearchDelegate extends SearchDelegate<String> with Utils {
  CustomSearchDelegate({required this.students});
  final List<StudentDetail> students;
  // These methods are mandatory you cannot skip them.
  @override
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  String? get searchFieldLabel => 'Tên học sinh';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = students
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (results.isEmpty) {
      return const Center(
        child: Text('Khong co ket qua nao'),
      );
    }
    return ListView.builder(
      itemCount: results.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => push(context, const StudentDetailScreen()),
          child: Container(
            margin: const EdgeInsets.all(8),
            height: screenHeight(context) * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                'https://robohash.org/YGY.png?set=set1&size=150x150'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth(context) * 0.76,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Text(
                                            results[index].name ?? '',
                                            style: AppTextStyles.defaultBold,
                                          ),
                                          const SizedBox(width: 6),
                                          SvgPicture.asset(
                                            results[index].gender == 'Male'
                                                ? Assets.svg.icMale.path
                                                : Assets.svg.icFemale.path,
                                            width: 16,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: LinearPercentIndicator(
                          width: 150.0,
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 15.0,
                          percent: 0.2,
                          center: const Text(' 2/10'),
                          progressColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 10,
                  bottom: 8,
                  child: GestureDetector(
                    onTap: () async {
                      await ShowSimpleDialog.topShowGeneralDialog(context,
                          childWidget: const PointForm());
                    },
                    child: const Icon(
                      Icons.brush_outlined,
                      color: AppColors.grey969696,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Nhập tên học sinh để tiến hành tìm kiếm'),
    );
  }
}

class CustomLocalization extends DefaultMaterialLocalizations {
  const CustomLocalization();

  @override
  String get searchFieldLabel => "Tên học sinh";
}
