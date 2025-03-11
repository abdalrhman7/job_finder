

import 'package:JobFinder/core/netwoking/api_result.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';
import 'package:JobFinder/features/home/data/models/jobs_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<JobsModel>> getRecentlyJobs() async {
    try {
      var response = await _apiService.getRecentlyJobs();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}