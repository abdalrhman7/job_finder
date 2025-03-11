import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/shared_pref_helper.dart';
import 'package:JobFinder/features/apply_job/data/models/apply_job_request.dart';
import 'package:JobFinder/features/apply_job/data/repo/apply_job_repo.dart';
import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:meta/meta.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit(this.applyJobRepo) : super(ApplyJobInitial());
  final ApplyJobRepo applyJobRepo;

  int activeStep = 0;
  bool isLastStep = false;
  FilePickerResult? pickedFile;
  File? file;
  String? fileName;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> pickFile() async {
    pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    file = File(pickedFile!.files.single.path ?? '');
    fileName = file!.path.split('/').last;
    emit(PickedCvSuccess());
  }

  void applyJob(Job job) async {
    ApplyJobRequest applyJobRequest = ApplyJobRequest(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      workType: job.jobTimeType ?? '',
      userId: AppConstants.userId,
      jobId: job.id.toString(),
    );
    FormData formData = FormData.fromMap({
      'other_file': await MultipartFile.fromFile(
        file!.path,
        filename: fileName,
      ),
      ...applyJobRequest.toJson(),
    });
    var result = await applyJobRepo.applyJob(formData);
    result.when(
      success: (_) {
        emit(ApplyJobSuccess());
      },
      failure: (errorMessage) {
        emit(ApplyJobFailure());
      },
    );
  }

  void increaseCurrentStep() {
    if (activeStep < 1) {
      activeStep++;
      isLastStep = true;
      emit(ChangeCurrentStep());
    }
  }

  void decreaseCurrentStep() {
    if (activeStep > 0) {
      activeStep--;
      isLastStep = false;
      emit(ChangeCurrentStep());
    }
  }
}
