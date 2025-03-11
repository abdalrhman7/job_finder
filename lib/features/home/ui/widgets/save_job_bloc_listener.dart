import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/core/widgets/show_bar.dart';
import 'package:JobFinder/features/home/ui/widgets/jop_card_widget.dart';
import 'package:JobFinder/features/home/ui/widgets/welcome_widget.dart';
import 'package:JobFinder/features/saved/logic/save_job_cubit.dart';

class SaveJobBlocListener extends StatelessWidget {
  const SaveJobBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveJobCubit, SaveJobState>(
      listenWhen: (previous, current) => current is AddToSavedJobSuccess,
      listener: (context, state) {
        if(state is AddToSavedJobSuccess) {
          showBar(context, 'Job saved successfully');
        }
      },
      child: SizedBox.shrink(),
    );
  }
}