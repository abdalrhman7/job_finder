// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyJobRequest _$ApplyJobRequestFromJson(Map<String, dynamic> json) =>
    ApplyJobRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['mobile'] as String,
      workType: json['work_type'] as String,
      jobId: json['jobs_id'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$ApplyJobRequestToJson(ApplyJobRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.phone,
      'work_type': instance.workType,
      'jobs_id': instance.jobId,
      'user_id': instance.userId,
    };
