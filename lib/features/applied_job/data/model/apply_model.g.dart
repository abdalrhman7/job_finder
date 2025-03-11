// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyModel _$ApplyModelFromJson(Map<String, dynamic> json) => ApplyModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ApplyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApplyModelToJson(ApplyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

ApplyData _$ApplyDataFromJson(Map<String, dynamic> json) => ApplyData(
      id: (json['id'] as num?)?.toInt(),
      workType: json['work_type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ApplyDataToJson(ApplyData instance) => <String, dynamic>{
      'id': instance.id,
      'work_type': instance.workType,
      'created_at': instance.createdAt?.toIso8601String(),
    };
