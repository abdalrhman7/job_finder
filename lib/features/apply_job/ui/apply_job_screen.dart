import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/di/dependancy_injection.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/apply_job/data/repo/apply_job_repo.dart';
import 'package:JobFinder/features/apply_job/logic/apply_job_cubit.dart';
import 'package:JobFinder/features/apply_job/ui/apply_job_body.dart';
import 'package:JobFinder/features/home/data/models/job.dart';

class ApplyJobScreen extends StatelessWidget {
  const ApplyJobScreen({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Job Details', style: TextStyles.font18DarkBlueBold,),
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.bookmark_outline),
          horizontalSpace(12),
        ],
      ),
      body: BlocProvider(
        create: (context) => ApplyJobCubit(getIt<ApplyJobRepo>()),
        child: ApplyJobBody(job: job),
      ),
    );
  }
}

