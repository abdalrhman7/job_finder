import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/shared_pref_helper.dart';
import 'package:JobFinder/features/profile/data/model/profile_model.dart';
import 'package:JobFinder/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    emit(GetProfileDataLoading());
    var result = await profileRepo.getProfile();
    result.when(
      success: (data) async {
       await saveUserData(data.profileData!);
        emit(GetProfileDataSuccess());
      },
      failure: (errorMessage) {
        emit(GetProfileDataFailure());
      },
    );
  }

  saveUserData(UserData profileData) async {
    await SharedPrefHelper.setData(
        SharedPrefKeys.userData, jsonEncode(profileData.toJson()));
    String userData = await SharedPrefHelper.getString(SharedPrefKeys.userData);
    AppConstants.userData = UserData.fromJson(jsonDecode(userData));
  }
}
