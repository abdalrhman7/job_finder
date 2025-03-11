part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileDataLoading extends ProfileState {}

final class GetProfileDataSuccess extends ProfileState {
  // final UserData profileData;

  GetProfileDataSuccess();
}

final class GetProfileDataFailure extends ProfileState {}
