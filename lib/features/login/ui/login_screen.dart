import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/extensions.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/routing/routes.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/core/widgets/dont_have_account_text.dart';
import 'package:JobFinder/features/login/logic/login_cubit.dart';
import 'package:JobFinder/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:JobFinder/features/login/ui/widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  'Login Now',
                  style: TextStyles.font30BlackSemiBold,
                ),
                verticalSpace(6),
                Text(
                  'Create an account to find your dream job',
                  style: TextStyles.font12GrayRegular,
                ),
                verticalSpace(8),
                LoginForm(),
                verticalSpace(16),
                AppTextButton(
                  buttonText: 'Login',
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                ),
                verticalSpace(16),
                AuthToggleText(
                  onTap: () {
                    context.pushReplacementNamed(Routes.signUpScreen);
                  },
                  title: 'Don\'t have an account?',
                  subtitle: 'Register now',
                ),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void validateThenDoSignup(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitLoginStates();
    }
  }
}
