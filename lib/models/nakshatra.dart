import 'package:json_annotation/json_annotation.dart';

part 'nakshatra.g.dart';

@JsonSerializable()
class Nakshatra {
  int? nakshatraNo;
  String? nakshatraName;
  String? ruler;
  String? special;
  String? summary;
  String? deity;
  Map<String, dynamic>? endTime;
  Nakshatra(
      {this.nakshatraNo,
      this.nakshatraName,
      this.ruler,
      this.special,
      this.summary,
      this.deity,
      this.endTime});
  factory Nakshatra.fromJson(Map<String, dynamic> json) =>
      _$NakshatraFromJson(json);

  Map<dynamic, dynamic> toJson() => _$NakshatraToJson(this);
}
