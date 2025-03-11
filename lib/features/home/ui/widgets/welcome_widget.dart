import 'package:flutter/material.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, new',
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(4),
        Text(
          'Create a better future for yourself here',
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}