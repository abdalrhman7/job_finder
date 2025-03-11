part of 'get_jobs_cubit.dart';

@immutable
sealed class GetJobsState {}

final class GetJobsInitial extends GetJobsState {}

final class GetJobsLoading extends GetJobsState {}

final class GetJobsSuccess extends GetJobsState {
  final List<Job> jobs;

  GetJobsSuccess({required this.jobs});
}

final class GetJobsFailure extends GetJobsState {
  final String errorMessage;

  GetJobsFailure({required this.errorMessage});
}



class SearchJobSuccess extends GetJobsState {}

class RestFilterJob extends GetJobsState {}

