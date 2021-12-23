// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nakshatra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nakshatra _$NakshatraFromJson(Map<String, dynamic> json) => Nakshatra(
      nakshatraName: json['details']['nak_name'] as String?,
      nakshatraNo: (json['details']['nak_number'] as num?)?.toInt(),
      ruler: json['details']['ruler'] as String?,
      summary: json['details']['summary'] as String?,
      special: json['details']['special'] as String?,
      deity: json['details']['deity'] as String?,
      endTime: json['end_time'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NakshatraToJson(Nakshatra instance) => <String, dynamic>{
      'nakshatraNo': instance.nakshatraNo,
      'nakshatraName': instance.nakshatraName,
      'special': instance.special,
      'summary': instance.summary,
      'deity': instance.deity,
      'endTime': instance.endTime,
      'ruler': instance.ruler,
    };
