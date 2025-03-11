import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/colors.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/features/apply_job/ui/apply_job_screen.dart';
import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:JobFinder/features/job_details/widgets/custom_tab_bar.dart';
import 'package:JobFinder/features/job_details/widgets/job_badge_widget.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class jobDetailsBody extends StatelessWidget {
  const jobDetailsBody({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JobBadgeWidget(
                    jobTypeOrRule: job.jobType ?? '',
                  ),
                  horizontalSpace(8),
                  JobBadgeWidget(
                    jobTypeOrRule: job.jobTimeType ?? '',
                  ),
                ],
              ),
              verticalSpace(12),
              SizedBox(
                height: 380.h,
                  child: CustomTabBar(job: job)),
              AppTextButton(
                buttonText: 'Apply Now',
                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () {
                  pushScreen(
                    context,
                    screen: ApplyJobScreen(job: job),
                    withNavBar: false,
                  );
                },
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
