part of 'apply_job_cubit.dart';

@immutable
sealed class ApplyJobState {}

final class ApplyJobInitial extends ApplyJobState {}

final class ChangeCurrentStep extends ApplyJobState {}

final class PickedCvSuccess extends ApplyJobState {}

final class ApplyJobSuccess extends ApplyJobState {}

final class ApplyJobFailure extends ApplyJobState {}
