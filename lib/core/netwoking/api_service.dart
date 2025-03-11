import 'dart:io';

import 'package:dio/dio.dart';
import 'package:JobFinder/features/applied_job/data/model/apply_model.dart';
import 'package:JobFinder/features/chat/data/models/chat_model.dart';
import 'package:JobFinder/features/chat/data/models/send_message_model.dart';
import 'package:JobFinder/features/home/data/models/jobs_model.dart';
import 'package:JobFinder/features/login/data/models/login_request_body.dart';
import 'package:JobFinder/features/login/data/models/login_response.dart';
import 'package:JobFinder/features/profile/data/model/profile_model.dart';
import 'package:JobFinder/features/saved/data/models/saved_job_model.dart';
import 'package:JobFinder/features/sign_up/data/models/sign_up_request_body.dart';

import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody,
      );

  @POST(ApiConstants.signUp)
  Future<void> signup(
      @Body() SignupRequestBody signupRequestBody,
      );

  @GET(ApiConstants.getRecentlyJobs)
  Future<JobsModel> getRecentlyJobs();


  @POST(ApiConstants.savedJobs)
  Future<void> addToSavedJob(@Body() Map<String, dynamic> body);

  @GET(ApiConstants.savedJobs)
  Future<SavedJobModel> getSavedJob();

  @DELETE(ApiConstants.removeFromSaved + '{id}')
  Future<SavedJobModel> deleteSavedJob(@Path() String id);

  @POST(ApiConstants.apply)
  Future<void> applyJob(@Body() FormData formData);

  @GET(ApiConstants.getChat)
  Future<ChatModel> getChat(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.sendMessageFromUser)
  Future<void> sendMessage(@Body() SendMassageDataModel sendMassageDataModel);

  @GET(ApiConstants.getApply + '{id}')
  Future<ApplyModel> getAppliedJob(@Path() String id);

  @GET(ApiConstants.getUserProfile)
  Future<ProfileModel> getProfileData();
}
