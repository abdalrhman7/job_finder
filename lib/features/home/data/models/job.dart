import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';


@JsonSerializable()
class Job {
  int? id;
  String? name;
  String? image;
  @JsonKey(name: 'job_time_type')
  String? jobTimeType;
  @JsonKey(name: 'job_type')
  String? jobType;
  String? jobLevel;
  @JsonKey(name: 'job_description')
  String? jobDescription;
  @JsonKey(name: 'job_skill')
  String? jobSkill;
  @JsonKey(name: 'comp_name')
  String? compName;
  @JsonKey(name: 'comp_email')
  String? compEmail;
  @JsonKey(name: 'comp_website')
  String? compWebsite;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  @JsonKey(name: 'about_comp')
  String? aboutComp;

  Job({
    this.id,
    this.name,
    this.image,
    this.jobTimeType,
    this.jobType,
    this.jobLevel,
    this.jobDescription,
    this.jobSkill,
    this.compName,
    this.compEmail,
    this.compWebsite,
    this.location,
    this.salary,
    this.favorites,
    this.expired,
    this.aboutComp,
  });


  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
