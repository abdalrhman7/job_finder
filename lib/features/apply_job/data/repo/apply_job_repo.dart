

import 'package:dio/dio.dart';
import 'package:JobFinder/core/netwoking/api_result.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';


class ApplyJobRepo {
  final ApiService _apiService;

  ApplyJobRepo(this._apiService);

  Future<ApiResult<void>> applyJob(
      FormData formData) async {
    try {
      await _apiService.applyJob(formData);
      return ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}