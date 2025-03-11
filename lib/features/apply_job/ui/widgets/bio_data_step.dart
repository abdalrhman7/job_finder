import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/features/apply_job/logic/apply_job_cubit.dart';


class BioDataStep extends StatelessWidget {
  const BioDataStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ApplyJobCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Enter your full name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            prefixIcon: const Icon(Icons.person_2_outlined),
            controller: cubit.nameController,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(8),
          AppTextFormField(
            hintText: 'Enter your email',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            prefixIcon: const Icon(Icons.email_outlined),
            controller: cubit.emailController,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(8),
          AppTextFormField(
            hintText: 'Enter your phone number',
            validator: (value) {
              if (value!.isEmpty || value.length < 11) {
                return 'Please enter your phone number';
              }
              return null;
            },
            prefixIcon: const Icon(Icons.phone),
            controller: cubit.phoneController,
            maxLength: 11,
            keyboardType:  TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}

