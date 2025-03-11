// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

ChatModelData _$ChatModelDataFromJson(Map<String, dynamic> json) =>
    ChatModelData(
      id: (json['id'] as num?)?.toInt(),
      massage: json['massage'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      compId: (json['comp_id'] as num?)?.toInt(),
      senderUser: json['sender_user'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChatModelDataToJson(ChatModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'massage': instance.massage,
      'user_id': instance.userId,
      'comp_id': instance.compId,
      'sender_user': instance.senderUser,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
