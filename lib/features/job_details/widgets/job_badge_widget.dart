import 'package:flutter/material.dart';
import 'package:JobFinder/core/theming/styels.dart';

class JobBadgeWidget extends StatelessWidget {
  const JobBadgeWidget({super.key, required this.jobTypeOrRule});
  final String jobTypeOrRule ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.lightBlue.shade200,
      ),
      child: Center(
        child: Text(jobTypeOrRule, style: TextStyles.font14BlackRegular,),
      ),
    );
  }
}

