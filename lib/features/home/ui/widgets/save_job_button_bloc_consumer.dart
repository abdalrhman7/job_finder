import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/theming/colors.dart';
import 'package:JobFinder/core/widgets/show_bar.dart';
import 'package:JobFinder/features/saved/logic/save_job_cubit.dart';

class SaveJobButtonBlocBuilder extends StatelessWidget {
  const SaveJobButtonBlocBuilder({super.key, required this.jobId});

  final int jobId;

  @override
  Widget build(BuildContext context) {
    var saveJobCubit = context.read<SaveJobCubit>();

    return BlocBuilder<SaveJobCubit, SaveJobState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            saveJobCubit.isJobSaved(jobId)
                ? saveJobCubit.deleteSavedJobs(jobId.toString())
                : saveJobCubit.addJobAndUpdateSavedList(jobId.toString());
          },
          child: saveJobCubit.isJobSaved(jobId)
              ? Icon(
                  Icons.bookmark,
                  color: ColorsManager.mainBlue,
                )
              : Icon(Icons.bookmark_outline),
        );
      },
    );
  }
}
