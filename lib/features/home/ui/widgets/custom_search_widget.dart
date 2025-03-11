import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/home/logic/get_jobs_cubit/get_jobs_cubit.dart';
import 'package:JobFinder/features/job_details/ui/job_details_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetJobsCubit>();

    return BlocBuilder<GetJobsCubit, GetJobsState>(
      builder: (context, state) {
        return SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return GestureDetector(
              onTap: () => controller.openView(),
              child: Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    horizontalSpace(12),
                    Text(
                      'Search For Job',
                      style: TextStyles.font14GrayRegular,
                    ),
                  ],
                ),
              ),
            );
          },
          viewOnChanged: (value) {
            print('value: $value');
            cubit.searchJob(value);
          },
          suggestionsBuilder: (context, controller) {
            return cubit.filteredJobs
                .map((job) => ListTile(
              title: Text(job.name ?? 'No Name'),
              onTap: () {
                pushScreen(
                  context,
                  screen: JobDetailsScreen(job: job,),
                  withNavBar: false,
                );
              },
            ))
                .toList();
          },

        );
      },
    );
  }
}

// viewBuilder: (suggestions) {
//   return Material(
//     child: ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('qqqqqqq${cubit.filteredJobs[index].name}' ??
//               'No Name'),
//           onTap: () {
//             print('Selected job: ${cubit.filteredJobs[index].name}');
//           },
//         );
//       },
//     ),
//   );
// },
