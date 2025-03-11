part of 'applied_job_cubit.dart';

@immutable
sealed class AppliedJobState {}

final class AppliedJobInitial extends AppliedJobState {}

final class GetAppliedJobLoading extends AppliedJobState {}

final class GetAppliedJobSuccess extends AppliedJobState {
  final List<ApplyData> applyData;
  GetAppliedJobSuccess({required this.applyData});
}

final class GetAppliedJobFailure extends AppliedJobState {}
