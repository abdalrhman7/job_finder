import 'package:JobFinder/core/netwoking/api_result.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';
import 'package:JobFinder/features/chat/data/models/chat_model.dart';
import 'package:JobFinder/features/chat/data/models/send_message_model.dart';
import 'package:JobFinder/features/saved/data/models/saved_job_model.dart';

class ChatRepo {
  final ApiService apiService;

  ChatRepo(this.apiService);

  Future<ApiResult<ChatModel>> getChat(Map<String, dynamic> body) async {
    try {
      var response = await apiService.getChat(body);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> sendMessage(SendMassageDataModel sendMassageDataModel) async {
    try {
      await apiService.sendMessage(sendMassageDataModel);
      return ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
