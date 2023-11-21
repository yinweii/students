import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/common_appbar.dart';
import 'package:students/components/common_button.dart';
import 'package:students/components/input_form.dart';
import 'package:students/components/text_form_field.dart';
import 'package:students/models/class_model.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/date_time_util.dart';
import 'package:students/utils/utils.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

enum Gender { male, female }

class CreateStudentScreen extends ConsumerStatefulWidget {
  const CreateStudentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateStudentScreenState();
}

class _CreateStudentScreenState extends ConsumerState<CreateStudentScreen>
    with Utils {
  Gender? _selected = Gender.male;
  Class? selectedValue;
  String? classType = 'Chính Quy';
  DateTime? selectDatetime;
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _nameOfContractController;
  late TextEditingController _phoneOfContractController;
  late TextEditingController _emailOfContractController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _nameOfContractController = TextEditingController();
    _phoneOfContractController = TextEditingController();
    _emailOfContractController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _nameOfContractController.dispose();
    _phoneOfContractController.dispose();
    _emailOfContractController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Thông tin học sinh',
        showBackButton: true,
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
                                  style: AppTextStyles.defaultBold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: classType ?? 'Chính Quy',
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
                    child: DropdownButton2<Class>(
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
                      items: <Class>[]
                          .map((Class item) => DropdownMenuItem<Class>(
                                value: item,
                                child: Text(
                                  item.name ?? '',
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
                  controller: _nameController,
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
                        child: GestureDetector(
                          onTap: () async {
                            final newDateTime = await showRoundedDatePicker(
                              height: screenHeight(context) * 0.36,
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 50),
                              lastDate: DateTime(DateTime.now().year + 1),
                              borderRadius: 16,
                            );
                            setState(() {
                              selectDatetime = newDateTime;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(selectDatetime == null
                                  ? 'yyyy-MM-dd'
                                  : DateTimeUtil.updateTime(
                                          selectDatetime.toString()) ??
                                      ''),
                              const Icon(Icons.date_range)
                            ],
                          ),
                        ),
                      ),
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
                  controller: _phoneNumberController,
                ),
              ),
            ),
            FormInputField(
              label: 'Email',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: _emailController,
                ),
              ),
            ),
            FormInputField(
              label: 'Địa chỉ nhà',
              inputWidget: SizedBox(
                child: TextFormFieldCustom(
                  maxLines: 3,
                  controller: _addressController,
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
                  controller: _nameOfContractController,
                ),
              ),
            ),
            FormInputField(
              label: 'Sdt',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: _phoneOfContractController,
                ),
              ),
            ),
            FormInputField(
              label: 'Email',
              inputWidget: SizedBox(
                height: 54,
                child: TextFormFieldCustom(
                  controller: _emailOfContractController,
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
