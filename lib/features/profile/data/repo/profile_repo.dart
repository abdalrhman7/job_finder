import 'package:JobFinder/core/netwoking/api_result.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';
import 'package:JobFinder/features/profile/data/model/profile_model.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileModel>> getProfile() async{
    try {
      var response =await _apiService.getProfileData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
