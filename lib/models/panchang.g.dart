// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panchang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Panchang _$PanchangFromJson(Map<String, dynamic> json) => Panchang(
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      vedicRise: json['vedicRise'] as String?,
      vedicSet: json['vedicSet'] as String?,
      nakshatra: json['nakshatra'] == null
          ? null
          : Nakshatra.fromJson(json['nakshatra'] as Map<String, dynamic>),
      tithi: json['tithi'] == null
          ? null
          : Tithi.fromJson(json['tithi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PanchangToJson(Panchang instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'vedicRise': instance.vedicRise,
      'vedicSet': instance.vedicSet,
      'tithi': instance.tithi,
      'nakshatra': instance.nakshatra,
    };
