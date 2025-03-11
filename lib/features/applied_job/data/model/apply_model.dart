import 'package:json_annotation/json_annotation.dart';

part 'apply_model.g.dart';

@JsonSerializable()
class ApplyModel {
  bool? status;
  List<ApplyData>? data;

  ApplyModel({this.status, this.data});

  factory ApplyModel.fromJson(Map<String, dynamic> json) =>
      _$ApplyModelFromJson(json);
}

@JsonSerializable()
class ApplyData {
  int? id;
  @JsonKey(name: 'work_type')
  String? workType;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  ApplyData({
    this.id,
    this.workType,
    this.createdAt,
  });

  factory ApplyData.fromJson(Map<String, dynamic> json) =>
      _$ApplyDataFromJson(json);
}
