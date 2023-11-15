import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:students/components/common_button.dart';
import 'package:students/components/input_form.dart';
import 'package:students/components/text_form_field.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/utils.dart';

class PointForm extends ConsumerWidget with Utils {
  const PointForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  title: 'Thuộc bài',
                  trailing: const SizedBox.shrink(),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Thế bấm',
                  trailing: const SizedBox.shrink(),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Nhịp phách',
                  trailing: const SizedBox.shrink(),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Mât trật tự:',
                  trailing: _buildVoteItem(),
                  onTap: () {},
                ),
                const Divider(),
                _buildListTilte(
                  title: 'Chăm ngoan:',
                  trailing: _buildVoteItem(isGood: true),
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FormInputField(
                    label: 'Nhận xét',
                    inputWidget: TextFormFieldCustom(
                      controller: TextEditingController(),
                      maxLines: 4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CommonButton(
                    label: 'Hoàn thành',
                    onTap: () {
                      Navigator.pop(context, {'meo': 'hihih'});
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
  }) {
    return Row(
      children: List.generate(
        5,
        (index) => Container(
          margin: const EdgeInsets.only(right: 4),
          child: SvgPicture.asset(
            isGood ? Assets.svg.icHappy.path : Assets.svg.icSad.path,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
