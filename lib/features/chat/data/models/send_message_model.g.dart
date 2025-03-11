// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMassageDataModel _$SendMassageDataModelFromJson(
        Map<String, dynamic> json) =>
    SendMassageDataModel(
      massage: json['massage'] as String?,
      userId: json['user_id'] as String?,
      compId: json['comp_id'] as String?,
    );

Map<String, dynamic> _$SendMassageDataModelToJson(
        SendMassageDataModel instance) =>
    <String, dynamic>{
      'massage': instance.massage,
      'user_id': instance.userId,
      'comp_id': instance.compId,
    };
