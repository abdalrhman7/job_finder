import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:JobFinder/features/saved/data/models/saved_job_model.dart';
import 'package:JobFinder/features/saved/data/models/saved_job_model_data.dart';
import 'package:JobFinder/features/saved/data/repo/save_job_repo.dart';
import 'package:meta/meta.dart';

part 'save_job_state.dart';

class SaveJobCubit extends Cubit<SaveJobState>  {
  SaveJobCubit(this._saveJobRepo) : super(SaveJobInitial());

  final SaveJobRepo _saveJobRepo;

  List<int> savedJobId = [];
  List<SavedJobModelData> savedJobsModel = [];

  Future<void> getSavedJobs() async {
    emit(GetSavedJobsLoading());
    final response = await _saveJobRepo.getSavedJobs();
    response.when(
      success: (data) {
        savedJobId.clear();
        savedJobsModel.clear();
        savedJobId.addAll(data.data?.map((e) => e.jobId ?? 0).toList() ?? []);
        savedJobsModel.addAll(data.data!);
        emit(GetSavedJobsSuccess());
      },
      failure: (errorMessage) {
        emit(GetSavedJobsFailure());
      },
    );
  }

  Future<void> addJobAndUpdateSavedList(String jobId) async {
    emit(AddToSavedJobLoading());
    final response =  await _saveJobRepo.addToSavedJob(jobId);
    response.when(
      success: (data) {
        savedJobId.add(int.parse(jobId));
        getSavedJobs();
        emit(AddToSavedJobSuccess());
      },
      failure: (errorMessage) {
        emit(AddToSavedJobFailure());
      },
    );
  }

  Future<void> deleteSavedJobs(String id) async {
    emit(DeleteSavedJobLoading());
    final response =  await _saveJobRepo.deleteSavedJobs(savedJobsModel.firstWhere((e) => e.jobId == int.parse(id)).id.toString());
    response.when(
      success: (data) {
        savedJobId.remove(int.parse(id));
        savedJobsModel.removeWhere((e) => e.jobId == int.parse(id));
        emit(DeleteSavedJobSuccess());
      },
      failure: (errorMessage) {
        emit(DeleteSavedJobFailure());
      },
    );
  }

  bool isJobSaved(int jobId) {
    return savedJobId.contains(jobId);
  }

}
