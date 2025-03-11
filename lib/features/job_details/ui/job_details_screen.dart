import 'package:flutter/material.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/home/data/models/job.dart';

import 'job_details_body.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key, required this.job});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Job Details', style: TextStyles.font18DarkBlueBold,),
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.bookmark_outline),
          horizontalSpace(12)
        ],
      ),
      body: jobDetailsBody(job: job,),
    );
  }
}


