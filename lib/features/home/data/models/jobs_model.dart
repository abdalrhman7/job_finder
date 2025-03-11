import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jobs_model.g.dart';

@JsonSerializable()
class JobsModel {
  bool? status;
  List<Job>? data;

  JobsModel({this.status, this.data});

  factory JobsModel.fromJson(Map<String, dynamic> json) =>
      _$JobsModelFromJson(json);
}
