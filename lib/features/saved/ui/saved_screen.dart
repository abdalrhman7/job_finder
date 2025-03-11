import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/home/ui/widgets/jop_card_widget.dart';
import 'package:JobFinder/features/saved/logic/save_job_cubit.dart';
import 'package:JobFinder/features/saved/ui/widget/empty_saved_widget.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SaveJobCubit>();
    return Column(
      children: [
        BlocBuilder<SaveJobCubit, SaveJobState>(
          builder: (context, state) {
            return cubit.savedJobsModel.isEmpty ? EmptyPageWidget(
              imgPath: 'assets/images/saved.svg',
              title: 'Nothing has been saved yet!',
              subtitle: 'Save your favorite jobs here',
            ) : Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16, right: 12 , left: 12),
                itemBuilder: (context, index) {

                  return JobCardWidget(job: cubit.savedJobsModel[index].jobs!,);
                },
                itemCount: cubit.savedJobsModel.length,
              ),
            );
          },
        )
      ],
    );
  }
}

