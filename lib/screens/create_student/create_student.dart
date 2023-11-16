import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/common_button.dart';
import 'package:students/components/input_form.dart';
import 'package:students/components/text_form_field.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/utils.dart';

enum Gender { male, female }

final List<String> itemsClass = [
  'Lớp học 1',
  'Lớp học 2',
  'Lớp học 3',
  'Lớp học 4',
  'Lớp học 5',
  'Lớp học 6',
  'Lớp học 7',
];

class CreateStudentScreen extends ConsumerStatefulWidget {
  const CreateStudentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateStudentScreenState();
}

class _CreateStudentScreenState extends ConsumerState<CreateStudentScreen>
    with Utils {
  Gender? _selected = Gender.male;
  String? selectedValue;
  String? classType;
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
              'Thông tin lớp',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: [
                        'Chính Quy',
                        'Dạy thêm',
                      ]
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: classType,
                      onChanged: (String? value) {
                        setState(() {
                          classType = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  width: screenWidth(context) * 0.4,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Chọn lớp học',
                              style: AppTextStyles.defaultBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: itemsClass
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: AppTextStyles.defaultBold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        iconSize: 20,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey[200],
                        ),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
