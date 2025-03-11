import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/core/widgets/show_bar.dart';
import 'package:JobFinder/features/apply_job/logic/apply_job_cubit.dart';
import 'package:JobFinder/features/home/data/models/job.dart';

class StepNavigationButtons extends StatelessWidget {
  const StepNavigationButtons({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ApplyJobCubit>();
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      buildWhen: (previous, current) => current is PickedCvSuccess,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: !cubit.isLastStep
              ? AppTextButton(
                  buttonText: 'Next',
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.increaseCurrentStep();
                    }
                  },
                )
              : Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        buttonText: 'Previous',
                        textStyle: TextStyles.font16WhiteMedium,
                        onPressed: () {
                          cubit.decreaseCurrentStep();
                        },
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: AppTextButton(
                        buttonText: 'Next',
                        textStyle: TextStyles.font16WhiteMedium,
                        onPressed: () {
                          cubit.pickedFile == null
                              ? showBar(context, 'Please upload your cv')
                              : cubit.applyJob(job);
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
