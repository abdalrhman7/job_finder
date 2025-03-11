// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_job_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedJobModelData _$SavedJobModelDataFromJson(Map<String, dynamic> json) =>
    SavedJobModelData(
      id: (json['id'] as num?)?.toInt(),
      jobId: (json['job_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      jobs: json['jobs'] == null
          ? null
          : Job.fromJson(json['jobs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SavedJobModelDataToJson(SavedJobModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_id': instance.jobId,
      'user_id': instance.userId,
      'jobs': instance.jobs,
    };
