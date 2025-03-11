import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/extensions.dart';
import 'package:JobFinder/core/routing/routes.dart';
import 'package:JobFinder/features/home/logic/get_jobs_cubit/get_jobs_cubit.dart';
import 'package:JobFinder/features/home/ui/widgets/jop_card_widget.dart';
import 'package:JobFinder/features/job_details/ui/job_details_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class RecentlyJobBlocBuilder extends StatelessWidget {
  const RecentlyJobBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetJobsCubit, GetJobsState>(
      buildWhen: (previous, current) => current is GetJobsSuccess || current is GetJobsFailure || current is GetJobsLoading,
      builder: (context, state) {
        if (state is GetJobsSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    pushScreen(
                      context,
                      screen: JobDetailsScreen(job: state.jobs[index],),
                      withNavBar: false,
                    );
                  },
                  child: JobCardWidget(
                    job: state.jobs[index],
                  ),
                );
              },
            ),
          );
        } else if (state is GetJobsFailure) {
          return Text('something went wrong');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
