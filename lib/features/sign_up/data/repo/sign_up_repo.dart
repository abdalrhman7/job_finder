import '../../../../core/netwoking/api_result.dart';
import '../../../../core/netwoking/api_service.dart';
import '../models/sign_up_request_body.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<void>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      await _apiService.signup(signupRequestBody);
      return ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
