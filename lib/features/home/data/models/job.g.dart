// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      jobTimeType: json['job_time_type'] as String?,
      jobType: json['job_type'] as String?,
      jobLevel: json['jobLevel'] as String?,
      jobDescription: json['job_description'] as String?,
      jobSkill: json['job_skill'] as String?,
      compName: json['comp_name'] as String?,
      compEmail: json['comp_email'] as String?,
      compWebsite: json['comp_website'] as String?,
      location: json['location'] as String?,
      salary: json['salary'] as String?,
      favorites: (json['favorites'] as num?)?.toInt(),
      expired: (json['expired'] as num?)?.toInt(),
      aboutComp: json['about_comp'] as String?,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'job_time_type': instance.jobTimeType,
      'job_type': instance.jobType,
      'jobLevel': instance.jobLevel,
      'job_description': instance.jobDescription,
      'job_skill': instance.jobSkill,
      'comp_name': instance.compName,
      'comp_email': instance.compEmail,
      'comp_website': instance.compWebsite,
      'location': instance.location,
      'salary': instance.salary,
      'favorites': instance.favorites,
      'expired': instance.expired,
      'about_comp': instance.aboutComp,
    };
