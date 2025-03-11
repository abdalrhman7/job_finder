import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: 'data')
  UserData? profileData;
  bool? status;

  ProfileModel({this.profileData, this.status});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@JsonSerializable()
class UserData {
  String? name;
  String? email;

  UserData({this.name, this.email});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  toJson() => _$UserDataToJson(this);



}
