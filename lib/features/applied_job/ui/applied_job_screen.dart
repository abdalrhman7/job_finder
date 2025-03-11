import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/di/dependancy_injection.dart';
import 'package:JobFinder/features/applied_job/data/repo/applied_job_repo.dart';
import 'package:JobFinder/features/applied_job/logic/applied_job_cubit.dart';
import 'package:JobFinder/features/applied_job/ui/applied_job_body.dart';

class AppliedJobScreen extends StatelessWidget {
  const AppliedJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppliedJobCubit(getIt<AppliedJobRepo>())..getAppliedJob(),
      child: AppliedJobBody(),
    );
  }
}
