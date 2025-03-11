// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedJobModel _$SavedJobModelFromJson(Map<String, dynamic> json) =>
    SavedJobModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SavedJobModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedJobModelToJson(SavedJobModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
