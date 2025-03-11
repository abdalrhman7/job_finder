import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/colors.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:JobFinder/features/job_details/widgets/tab_content_widget.dart';


class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.job});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Expanded(
        child: Column(
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              child: TabBar(
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                physics: const BouncingScrollPhysics(),
                splashBorderRadius: BorderRadius.circular(
                  25,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  color: ColorsManager.mainBlue,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: ColorsManager.gray,
                tabs: [
                  Tab(
                    text: 'Description',
                  ),
                  Tab(
                    text: 'Company',
                  ),
                ],
              ),
            ),
            verticalSpace(12),
            Expanded(
              child: TabBarView(
                children: [
                TabContentWidget(
                sections: [
                  TabContentSection(heading: 'Job Description', content: job.jobDescription!),
                  TabContentSection(heading: 'Job Skills', content: job.jobSkill!),
                ],
              ),
              TabContentWidget(
                sections: [
                  TabContentSection(heading: 'Contact Us', content: 'Email: ${job.compEmail!}\nWebsite: ${job.compWebsite!}'),
                  TabContentSection(heading: 'About Company', content: job.aboutComp!),
                ],
              ),

              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


