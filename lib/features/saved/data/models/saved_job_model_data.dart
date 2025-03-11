
import 'package:JobFinder/features/home/data/models/job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_job_model_data.g.dart';


@JsonSerializable()
class SavedJobModelData {
  int? id;
  @JsonKey(name: 'job_id')
  int? jobId;
  @JsonKey(name: 'user_id')
  int? userId;
  Job? jobs;

  SavedJobModelData({
    this.id,
    this.jobId,
    this.userId,
    this.jobs,
  });

  factory SavedJobModelData.fromJson(Map<String, dynamic> json) => _$SavedJobModelDataFromJson(json);
}