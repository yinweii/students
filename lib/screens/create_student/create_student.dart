import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/common_button.dart';
import 'package:students/components/input_form.dart';
import 'package:students/components/text_form_field.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';

enum Gender { male, female }

class CreateStudentScreen extends ConsumerStatefulWidget {
  const CreateStudentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateStudentScreenState();
}

class _CreateStudentScreenState extends ConsumerState<CreateStudentScreen> {
  Gender? _selected = Gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin học sinh',
          style: AppTextStyles.defaultMedium,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16).copyWith(bottom: 24),
        child: CommonButton(
          height: 56,
          bgColor: AppColors.bgNav,
          label: 'Lưu thông tin',
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).copyWith(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(
              'Thông tin cá nhân',
            ),
            FormInputField(
              label: 'Họ và tên',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: TextEditingController(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FormInputField(
                      label: 'Ngày tháng năm sinh',
                      inputWidget: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          height: 54,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('dd/mm/yyyy'),
                              Icon(Icons.date_range)
                            ],
                          )),
                    ),
                  ),
                  // const SizedBox(width: 30),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FormInputField(
              label: 'Giới tính',
              inputWidget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text('Nữ'),
                      leading: Radio<Gender>(
                        value: Gender.female,
                        groupValue: _selected,
                        onChanged: (Gender? value) {
                          setState(() {
                            _selected = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Nam'),
                      leading: Radio<Gender>(
                        value: Gender.male,
                        groupValue: _selected,
                        onChanged: (Gender? value) {
                          setState(() {
                            _selected = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              color: AppColors.grey969696,
              padding: const EdgeInsets.all(6),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text('Ảnh thẻ'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildTitle(
              'Thông tin liên lạc',
            ),
            const SizedBox(height: 8),
            FormInputField(
              label: 'Sdt',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: TextEditingController(),
                ),
              ),
            ),
            FormInputField(
              label: 'Email',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: TextEditingController(),
                ),
              ),
            ),
            FormInputField(
              label: 'Địa chỉ nhà',
              inputWidget: SizedBox(
                child: TextFormFieldCustom(
                  maxLines: 3,
                  controller: TextEditingController(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildTitle(
              'Thông tin gia đình',
            ),
            FormInputField(
              label: 'Họ tên phụ huynh',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: TextEditingController(),
                ),
              ),
            ),
            FormInputField(
              label: 'Sdt',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: TextEditingController(),
                ),
              ),
            ),
            FormInputField(
              label: 'Email',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: TextEditingController(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Container(
      width: double.infinity,
      height: 30,
      margin: const EdgeInsets.only(bottom: 16),
      color: AppColors.bgNav,
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.defaultBold.copyWith(
            fontSize: 18,
            color: AppColors.black1,
          ),
        ),
      ),
    );
  }
}
