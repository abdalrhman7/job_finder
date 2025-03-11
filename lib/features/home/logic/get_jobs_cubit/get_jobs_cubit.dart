import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';
import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:JobFinder/features/home/data/models/jobs_model.dart';
import 'package:JobFinder/features/home/data/repo/home_repo.dart';


part 'get_jobs_state.dart';

class GetJobsCubit extends Cubit<GetJobsState> {
  GetJobsCubit(this._homeRepo) : super(GetJobsInitial());


  SearchController searchController = SearchController();
  final HomeRepo _homeRepo;
  List<Job> jobs = [];
  List<Job> filteredJobs = [];

  Future<void> getJobs() async {
    emit(GetJobsLoading());
    final response = await _homeRepo.getRecentlyJobs();
    response.when(success: (JobsModel jobsModel) {
      jobs = jobsModel.data ?? [];
      filteredJobs = jobs;
      emit(GetJobsSuccess(jobs: jobs));
    }, failure: (errorMessage) {
      emit(GetJobsFailure(errorMessage: errorMessage));
    });
  }

  void searchJob(String keyword) {
    print('Keyword: $keyword');

    filteredJobs = jobs.where((job) {
      final jobName = job.name!.toLowerCase();
      final searchKeyword = keyword.toLowerCase();

      return jobName.contains(searchKeyword) ||
          jobName.startsWith(searchKeyword) ||
          jobName.split(' ').any((word) => word.startsWith(searchKeyword));
    }).toList();

    print('FilteredJobs: $filteredJobs');
    emit(SearchJobSuccess());
  }



}


