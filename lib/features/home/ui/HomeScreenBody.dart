import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/core/widgets/show_bar.dart';
import 'package:JobFinder/features/home/logic/get_jobs_cubit/get_jobs_cubit.dart';
import 'package:JobFinder/features/home/ui/widgets/custom_search_widget.dart';
import 'package:JobFinder/features/home/ui/widgets/jop_card_widget.dart';
import 'package:JobFinder/features/home/ui/widgets/save_job_bloc_listener.dart';
import 'package:JobFinder/features/home/ui/widgets/welcome_widget.dart';
import 'package:JobFinder/features/saved/logic/save_job_cubit.dart';

import 'widgets/recently_job_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeWidget(),
            verticalSpace(16),
            CustomSearchWidget(),
            verticalSpace(12),
            Row(
              children: [
                Text('Recently Job', style: TextStyles.font16BlackSemiBold),
                Spacer(),
                Text('View All', style: TextStyles.font14BlueSemiBold),
              ],
            ),
            verticalSpace(12),
            RecentlyJobBlocBuilder(),
            SaveJobBlocListener(),
          ],
        ),
      ),
    );
  }
}
