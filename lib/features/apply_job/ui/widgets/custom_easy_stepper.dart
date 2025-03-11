import 'package:flutter/material.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/features/apply_job/logic/apply_job_cubit.dart';
import 'package:JobFinder/features/apply_job/ui/widgets/bio_data_step.dart';
import 'package:JobFinder/features/apply_job/ui/widgets/portfolio_step.dart';

class CustomEasyStepper extends StatelessWidget {
  const CustomEasyStepper({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ApplyJobCubit>();
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      builder: (context, state) {
        return CupertinoStepper(
          physics: NeverScrollableScrollPhysics(),
          type: StepperType.horizontal,
          currentStep: cubit.activeStep,
          steps: [
            Step(
              title: const Text('Bio Data'),
              isActive: cubit.activeStep >= 0,
              state: cubit.activeStep < 1 ? StepState.editing : StepState
                  .complete,
              content: BioDataStep(),
            ),
            Step(
              isActive: cubit.activeStep == 1,
              state: cubit.activeStep == 1 ? StepState.editing : StepState
                  .indexed,
              title: const Text('Portfolio'),
              content: const PortfolioStep(),
            ),
          ],
          controlsBuilder: (context, details) {
            return const SizedBox();
          },
        );
      },
    );
  }
}
