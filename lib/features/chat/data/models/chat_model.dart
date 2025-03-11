import 'package:json_annotation/json_annotation.dart';
part 'chat_model.g.dart';


@JsonSerializable()
class ChatModel{
  bool? status;
  List<ChatModelData>? data;

  ChatModel({
    this.status,
    this.data,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}


@JsonSerializable()
class ChatModelData {
  int? id;
  String? massage;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'comp_id')
  int? compId;
  @JsonKey(name: 'sender_user')
  String? senderUser;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  ChatModelData({
    this.id,
    this.massage,
    this.userId,
    this.compId,
    this.senderUser,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatModelData.fromJson(Map<String, dynamic> json) =>
      _$ChatModelDataFromJson(json);
}
