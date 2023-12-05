import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:students/components/common_button.dart';
import 'package:students/components/input_form.dart';
import 'package:students/components/text_form_field.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/models/student.dart';
import 'package:students/models/student_detail.dart';
import 'package:students/screens/student_list/student_list_state_notifier.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/date_time_util.dart';
import 'package:students/utils/utils.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class PointForm extends ConsumerStatefulWidget {
  const PointForm({super.key, this.student});
  final StudentDetail? student;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PointFormState();
}

class _PointFormState extends ConsumerState<PointForm> with Utils {
  late TextEditingController noteController;
  late TextEditingController speechController;
  late TextEditingController pressPositionController;
  late TextEditingController beatsController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteController = TextEditingController();
    speechController = TextEditingController();
    pressPositionController = TextEditingController();
    beatsController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    noteController
      ..clear()
      ..dispose();
    speechController
      ..clear()
      ..dispose();
    pressPositionController
      ..clear()
      ..dispose();
    beatsController
      ..clear()
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(studentLsitProvider(null).notifier);
    final state = ref.watch(studentLsitProvider(null));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: screenWidth(context),
          color: Colors.white,
          child: Card(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                _buildListTilte(
                  title: 'Ngày chấm',
                  trailing: GestureDetector(
                    onTap: () async {
                      final newDateTime = await showRoundedDatePicker(
                        height: screenHeight(context) * 0.36,
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 50),
                        lastDate: DateTime(DateTime.now().year + 1),
                        borderRadius: 16,
                      );
                      notifier.onSelectedDate(newDateTime ?? DateTime.now());
                    },
                    child: Row(
                      children: [
                        Text(DateTimeUtil.fromatDate(
                            state.selectDate ?? DateTime.now())),
                        const SizedBox(width: 16),
                        SvgPicture.asset(Assets.svg.icAddCalender.path),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                _buildListTilte(
                  title: 'Thuộc bài',
                  trailing: SizedBox(
                    width: 80,
                    child: TextFormFieldCustom(
                      controller: speechController,
                      maxLines: 1,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Thế bấm',
                  trailing: SizedBox(
                    width: 80,
                    child: TextFormFieldCustom(
                      controller: pressPositionController,
                      maxLines: 1,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Nhịp phách',
                  trailing: SizedBox(
                    width: 80,
                    child: TextFormFieldCustom(
                      controller: beatsController,
                      maxLines: 1,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Mât trật tự:',
                  trailing: _buildVoteItem(
                    levelCheck: state.noiseLevel,
                    onTap: (index) => notifier.onTapNosieLevel(index),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Chăm ngoan:',
                  trailing: _buildVoteItem(
                      isGood: true,
                      levelCheck: state.goodTakeLevel,
                      onTap: (index) => notifier.onTapGoodTakeLevel(index)),
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FormInputField(
                    label: 'Nhận xét',
                    inputWidget: TextFormFieldCustom(
                      controller: noteController,
                      maxLines: 4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CommonButton(
                    label: 'Hoàn thành',
                    onTap: () async {
                      await notifier
                          .createStudentPoint(
                            studentId: int.tryParse(widget.student?.id ?? ''),
                            speech: speechController.text,
                            pressPosition: pressPositionController.text,
                            noise: state.noiseLevel.toString(),
                            goodTake: state.goodTakeLevel.toString(),
                            beats: beatsController.text,
                            note: noteController.text,
                          )
                          .then((value) => Navigator.pop(context));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  ListTile _buildListTilte({
    required String title,
    String? subtilte,
    VoidCallback? onTap,
    required Widget trailing,
  }) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.defaultRegular400.copyWith(
          fontSize: 14,
        ),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              subtilte ?? '',
              style: AppTextStyles.defaultRegular400.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildVoteItem({
    bool isGood = false,
    int levelCheck = -1,
    required void Function(int index) onTap,
  }) {
    return Row(
      children: List.generate(
        5,
        (index) => GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 4),
            child: SvgPicture.asset(
              isGood ? Assets.svg.icHappy.path : Assets.svg.icSad.path,
              colorFilter: ColorFilter.mode(
                levelCheck >= index ? Colors.blue : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
