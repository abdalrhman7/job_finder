part of 'save_job_cubit.dart';

@immutable
sealed class SaveJobState {}

final class SaveJobInitial extends SaveJobState {}
final class AddToSavedJobLoading extends SaveJobState {}
final class AddToSavedJobSuccess extends SaveJobState {}
final class AddToSavedJobFailure extends SaveJobState {}

final class GetSavedJobsLoading extends SaveJobState {}
final class GetSavedJobsSuccess extends SaveJobState {}
final class GetSavedJobsFailure extends SaveJobState {}


final class DeleteSavedJobLoading extends SaveJobState {}
final class DeleteSavedJobSuccess extends SaveJobState {}
final class DeleteSavedJobFailure extends SaveJobState {}


