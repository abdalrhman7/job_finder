import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/features/profile/logic/profile_cubit.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileDataSuccess) {
          return Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey.shade700,
                ),
              ),
              verticalSpace(12),
              AppTextFormField(initialValue: AppConstants.userData.name , readOnly: true,),
              verticalSpace(16),
              AppTextFormField(initialValue: AppConstants.userData.email , readOnly: true,),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}