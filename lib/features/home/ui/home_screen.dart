import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/di/dependancy_injection.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/features/home/data/repo/home_repo.dart';
import 'package:JobFinder/features/home/logic/get_jobs_cubit/get_jobs_cubit.dart';
import 'package:JobFinder/features/home/ui/HomeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetJobsCubit(getIt<HomeRepo>())..getJobs(),
      child: HomeScreenBody(),
    );
  }
}





