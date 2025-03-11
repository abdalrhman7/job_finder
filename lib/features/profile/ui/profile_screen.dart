import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/di/dependancy_injection.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/shared_pref_helper.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/routing/routes.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/features/profile/data/repo/profile_repo.dart';
import 'package:JobFinder/features/profile/logic/profile_cubit.dart';
import 'package:JobFinder/features/profile/ui/widgets/profile_data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProfileCubit(getIt<ProfileRepo>())
        ..getProfile(),
      child: ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 12, left: 12),
          child: Column(
            children: [
              verticalSpace(12),
              ProfileDataWidget(),
              Spacer(),
              AppTextButton(
                buttonText: 'Logout',
                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () async {
                  await SharedPrefHelper.removeData(SharedPrefKeys.userData);
                  await SharedPrefHelper.removeData(SharedPrefKeys.userId);
                  await SharedPrefHelper.removeSecuredString(
                      SharedPrefKeys.userToken);
                  Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                    Routes.loginScreen,
                        (Route<dynamic> route) => false,
                  );
                },
              ),

            ],
          ),
        );

  }
}


