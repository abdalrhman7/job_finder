import 'package:JobFinder/features/login/data/models/login_request_body.dart';
import 'package:JobFinder/features/login/data/models/login_response.dart';

import '../../../../core/netwoking/api_result.dart';
import '../../../../core/netwoking/api_service.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
     var response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
