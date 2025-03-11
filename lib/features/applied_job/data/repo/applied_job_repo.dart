import 'package:JobFinder/core/netwoking/api_result.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';
import 'package:JobFinder/features/applied_job/data/model/apply_model.dart';

class AppliedJobRepo{
  final ApiService apiService;


  AppliedJobRepo(this.apiService);


  Future<ApiResult<ApplyModel>> getAppliedJob(String id)async {
    try {
      var response = await apiService.getAppliedJob(id);
      return ApiResult.success(response);
    }  catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}