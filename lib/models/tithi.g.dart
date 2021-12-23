// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tithi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tithi _$TithiFromJson(Map<String, dynamic> json) => Tithi(
      tithiName: json['details']['tithi_name'] as String?,
      summary: json['details']['summary'] as String?,
      special: json['details']['special'] as String?,
      tithiNo: (json['details']['tithi_number'] as num?)?.toInt(),
      deity: json['details']['deity'] as String?,
      endTime: json['end_time'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TithiToJson(Tithi instance) => <String, dynamic>{
      'tithiNo': instance.tithiNo,
      'tithiName': instance.tithiName,
      'special': instance.special,
      'summary': instance.summary,
      'deity': instance.deity,
      'endTime': instance.endTime,
    };
