


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/app_regex.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/features/sign_up/logic/sign_up_cubit.dart';
import 'package:JobFinder/features/sign_up/ui/widgets/password_validator.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: TextStyles.font16BlackSemiBold,
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: 'Enter your name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            prefixIcon: Icon(Icons.person_2_outlined),
            controller: cubit.nameController,
          ),
          verticalSpace(8),
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
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),


        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
