import 'package:json_annotation/json_annotation.dart';

part 'astrologer.g.dart';

@JsonSerializable()
class Astrologer {
  String? namePrefix;
  String? firstName;
  String? lastName;
  List? skills;
  List? languages;
  double? experience;
  String? price;
  double? additionalPerMinuteCharges;
  Map<String, dynamic>? images;
  Astrologer(
      {this.namePrefix,
      this.firstName,
      this.lastName,
      this.skills,
      this.experience,
      this.languages,
      this.price,
      this.additionalPerMinuteCharges,
      this.images});
  factory Astrologer.fromJson(Map<String, dynamic> json) =>
      _$AstrologerFromJson(json);

  Map<dynamic, dynamic> toJson() => _$AstrologerToJson(this);
}
