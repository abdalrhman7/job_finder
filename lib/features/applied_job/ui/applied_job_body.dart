import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/features/applied_job/logic/applied_job_cubit.dart';
import 'package:JobFinder/features/applied_job/ui/widgets/applied_job_widget.dart';

class AppliedJobBody extends StatelessWidget {
  const AppliedJobBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppliedJobCubit, AppliedJobState>(
      builder: (context, state) {
        if (state is GetAppliedJobLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAppliedJobSuccess) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: state.applyData.length,
            itemBuilder: (context, index) {
              return AppliedJobWidget(
                applyData: state.applyData[index],
              );
            },
          );
        } else {
          return const Center(child: Text('No Data'));
        }
      },
    );
  }
}
