import 'package:flutter/material.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/applied_job/data/model/apply_model.dart';



class AppliedJobWidget extends StatelessWidget {
  const AppliedJobWidget({super.key, required this.applyData});

  final ApplyData applyData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Data : ${applyData.createdAt.toString().replaceRange(11, 24, '')}',
                  style: TextStyles.font14DarkBlueMedium),
              verticalSpace(8),
              Text('Work Type : ${applyData.workType!}',
                  style: TextStyles.font14DarkBlueMedium),
            ],
          ),
          Spacer(),
          Text(
            'Active',
            style: TextStyles.font14BlueSemiBold,
          )
        ],
      ),
    );
  }
}
