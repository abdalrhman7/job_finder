import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/colors.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/show_bar.dart';
import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:JobFinder/features/home/ui/widgets/save_job_button_bloc_consumer.dart';
import 'package:JobFinder/features/saved/logic/save_job_cubit.dart';

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        // height: 120.h,
        child: Row(
          children: [
            Image.network(
              job.image ?? '',
              width: 80.w,
              fit: BoxFit.fill,
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                            '${job.name}',
                            style: TextStyles.font16BlackSemiBold,
                            overflow: TextOverflow.ellipsis,
                          )),
                      SaveJobButtonBlocBuilder(jobId: job.id!,),
                    ],
                  ),
                  verticalSpace(8),
                  Text(
                    '${job.compName}',
                    style: TextStyles.font14GrayRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${job.compEmail}',
                    style: TextStyles.font14GrayRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${job.jobTimeType}',
                        style: TextStyles.font14GrayRegular,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${job.salary}',
                        style: TextStyles.font14BlueSemiBold,
                        overflow: TextOverflow.ellipsis,
                      ),
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


