import 'package:JobFinder/core/netwoking/api_result.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';
import 'package:JobFinder/features/saved/data/models/saved_job_model.dart';

class SaveJobRepo {
  final ApiService _apiService;

  SaveJobRepo(this._apiService);

  Future<ApiResult<void>> addToSavedJob(String jobId) async {
    try {
      await _apiService.addToSavedJob({'job_id': jobId});
      return ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<SavedJobModel>>  getSavedJobs() async {
    try {
      final response = await _apiService.getSavedJob();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>>  deleteSavedJobs(String id) async {
    try {
      await _apiService.deleteSavedJob(id);
      return ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

}
