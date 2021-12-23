// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astrologer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Astrologer _$AstrologerFromJson(Map<String, dynamic> json) => Astrologer(
      namePrefix: json['namePrefix'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      skills: json['skills'] as List<dynamic>?,
      experience: (json['experience'] as num?)?.toDouble(),
      languages: json['languages'] as List<dynamic>?,
      price: json['price'] as String?,
      additionalPerMinuteCharges:
          (json['additionalPerMinuteCharges'] as num?)?.toDouble(),
      images: json['images'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AstrologerToJson(Astrologer instance) =>
    <String, dynamic>{
      'namePrefix': instance.namePrefix,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'skills': instance.skills,
      'languages': instance.languages,
      'experience': instance.experience,
      'price': instance.price,
      'additionalPerMinuteCharges': instance.additionalPerMinuteCharges,
      'images': instance.images,
    };
