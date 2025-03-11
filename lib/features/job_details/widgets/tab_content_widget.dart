import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/colors.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/home/data/models/job.dart';


class TabContentWidget extends StatelessWidget {
  const TabContentWidget({
    Key? key,
    required this.sections,
  }) : super(key: key);

  final List<TabContentSection> sections;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...sections.map((section) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section.heading,
                style: TextStyles.font16BlackSemiBold,
              ),
              verticalSpace(8),
              Text(
                section.content,
                style: TextStyles.font14BlackRegular,
              ),
            ],
          ),
        )),
      ],
    );
  }
}

class TabContentSection {
  final String heading;
  final String content;

  TabContentSection({required this.heading, required this.content});
}