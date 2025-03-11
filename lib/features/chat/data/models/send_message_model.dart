import 'package:json_annotation/json_annotation.dart';
part 'send_message_model.g.dart';

@JsonSerializable()
class SendMassageDataModel {
  String? massage;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'comp_id')
  String? compId;

  SendMassageDataModel({
    this.massage,
    this.userId,
    this.compId,
  });


  Map<String, dynamic> toJson() => _$SendMassageDataModelToJson(this);



}
