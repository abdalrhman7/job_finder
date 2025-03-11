import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/extensions.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/routing/routes.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/core/widgets/dont_have_account_text.dart';
import 'package:JobFinder/features/sign_up/logic/sign_up_cubit.dart';
import 'package:JobFinder/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:JobFinder/features/sign_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text(
                  'Sign Up',
                  style: TextStyles.font30BlackSemiBold,
                ),
                verticalSpace(6),
                Text(
                  'Create an account to find your dream job',
                  style: TextStyles.font12GrayRegular,
                ),
                verticalSpace(8),
                SignUpForm(),
                verticalSpace(16),
                AppTextButton(
                  buttonText: 'Sign Up',
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                ),
                verticalSpace(16),
                AuthToggleText(
                  onTap: () {
                    context.pushReplacementNamed(Routes.loginScreen);
                  },
                  title: 'Already have an account?',
                  subtitle: 'Sign In',
                ),
                SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitSignupStates();
    }
  }
}
