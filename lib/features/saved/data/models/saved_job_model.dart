

import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:JobFinder/features/saved/data/models/saved_job_model_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_job_model.g.dart';

@JsonSerializable()
class SavedJobModel {
  bool? status;
  List<SavedJobModelData>? data;

  SavedJobModel({this.status, this.data});

  factory SavedJobModel.fromJson(Map<String, dynamic> json) => _$SavedJobModelFromJson(json);
}


