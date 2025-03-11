import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/extensions.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/routing/routes.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/core/widgets/show_bar.dart';
import 'package:JobFinder/features/apply_job/logic/apply_job_cubit.dart';
import 'package:JobFinder/features/apply_job/ui/widgets/step_navigation_buttons.dart';
import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'widgets/custom_easy_stepper.dart';

class ApplyJobBody extends StatelessWidget {
  const ApplyJobBody({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ApplyJobCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              job.image ?? '',
              width: 120.w,
            ),
          ),
          verticalSpace(8),
          Text(
            job.name ?? '',
            style: TextStyles.font18DarkBlueBold,
          ),
          verticalSpace(8),
          Text(
            job.location ?? '',
            style: TextStyles.font14GrayRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(8),
          SizedBox(
            height: 400.h,
            child: CustomEasyStepper(),
          ),
          StepNavigationButtons(job: job),
          ApplyJobBlocListener(),
        ],
      ),
    );
  }
}

class ApplyJobBlocListener extends StatelessWidget {
  const ApplyJobBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyJobCubit, ApplyJobState>(
      listenWhen: (previous, current) {
        return current is ApplyJobSuccess || current is ApplyJobFailure;
      },
      listener: (context, state) {
        if(state is ApplyJobSuccess) {
          showBar(context, 'Job applied successfully');
          context.pushNamedAndRemoveUntil(Routes.bottomNavBar, predicate: (route) => false);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
