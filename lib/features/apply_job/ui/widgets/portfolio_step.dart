import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/app_text_button.dart';
import 'package:JobFinder/features/apply_job/logic/apply_job_cubit.dart';

class PortfolioStep extends StatelessWidget {
  const PortfolioStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Portfolio',
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(8),
        context
            .watch<ApplyJobCubit>()
            .pickedFile == null
            ? const UploadCvContainer()
            : const UploadedCvWidget(),
      ],
    );
  }
}

class UploadCvContainer extends StatelessWidget {
  const UploadCvContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Icon(
              Icons.upload,
              color: Colors.blue.shade700,
            ),
          ),
          verticalSpace(8),
          Text('Upload Your CV', style: TextStyles.font16BlackSemiBold),
          verticalSpace(8),
          Text('Max Size 1 MB', style: TextStyles.font14GrayRegular),
          verticalSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AppTextButton(
              buttonText: 'Add File',
              textStyle:
              TextStyles.font16WhiteMedium.copyWith(color: Colors.blue),
              onPressed: () {
                context.read<ApplyJobCubit>().pickFile();
              },
              backgroundColor: Colors.transparent,
              borderSide: BorderSide(color: Colors.blue),
              buttonHeight: 45,
              verticalPadding: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class UploadedCvWidget extends StatelessWidget {
  const UploadedCvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ApplyJobCubit>();
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Icon(
              Icons.picture_as_pdf_sharp,
              color: Colors.red,
              size: 45,
            ),
            horizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cubit.fileName}',
                  style: TextStyles.font16BlackSemiBold,
                ),
                verticalSpace(4),
                Text(
                  '${(cubit.pickedFile!.files.single.size / 1024 / 1024)
                      .toStringAsFixed(2)} MB',
                  style: TextStyles.font14GrayRegular,
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                cubit.pickFile();
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
            ),
            horizontalSpace(8),
          ]),
        );
      },
    );
  }
}
