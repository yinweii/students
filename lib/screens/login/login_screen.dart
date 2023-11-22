import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/components/common_button.dart';
import 'package:students/components/input_form.dart';
import 'package:students/components/text_form_field.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/screens/login/login_state_notifier.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_text_style.dart';
import 'package:students/utils/utils.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> with Utils {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(loginProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Assets.images.imagelogin.image(
                    fit: BoxFit.contain, height: screenHeight(context) * 0.17),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: AppTextStyles.defaultBold.copyWith(
                      color: AppColors.purple8862E9,
                      fontSize: 20,
                    ),
                  ),
                  FormInputField(
                    inputWidget: TextFormFieldCustom(
                      controller: _email,
                      hintText: 'Email',
                    ),
                  ),
                  FormInputField(
                    inputWidget: TextFormFieldCustom(
                      controller: _password,
                      hintText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CommonButton(
                  width: double.infinity,
                  label: 'Đăng nhập',
                  onTap: () async {
                    await notifier.login(
                      context,
                      email: _email.text,
                      password: _password.text,
                    );
                    
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: CommonButton(
                width: double.infinity,
                label: 'Đăng ký',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Term of use',
                style: AppTextStyles.defaultMedium.copyWith(
                  color: AppColors.purpleB299F2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }
}
