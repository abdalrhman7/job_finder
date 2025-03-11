

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/app_regex.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/features/login/logic/login_cubit.dart';
import 'package:JobFinder/features/sign_up/logic/sign_up_cubit.dart';
import 'package:JobFinder/features/sign_up/ui/widgets/password_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool isPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyles.font16BlackSemiBold,
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: 'Enter your email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            prefixIcon: Icon(Icons.email_outlined),
            controller: cubit.emailController,
          ),
          verticalSpace(8),
          Text(
            'Password',
            style: TextStyles.font16BlackSemiBold,
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: 'Enter your password',
            prefixIcon: Icon(Icons.lock_outline),
            controller: cubit.passwordController,
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
