import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_job_request.g.dart';

@JsonSerializable()
class ApplyJobRequest {
  final String name;
  final String email;
  @JsonKey(name: 'mobile')
  final String phone;
  @JsonKey(name: 'work_type')
  final String workType;
  @JsonKey(name: 'jobs_id')
  final String jobId;
  @JsonKey(name: 'user_id')
  final String userId;


  ApplyJobRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.workType,
    required this.jobId,
    required this.userId,
  });

  Map<String, dynamic> toJson() => _$ApplyJobRequestToJson(this);

}
