import 'package:json_annotation/json_annotation.dart';

part 'tithi.g.dart';

@JsonSerializable()
class Tithi {
  int? tithiNo;
  String? tithiName;
  String? special;
  String? summary;
  String? deity;
  Map<String, dynamic>? endTime;
  Tithi(
      {this.tithiNo,
      this.tithiName,
      this.special,
      this.summary,
      this.deity,
      this.endTime});
  factory Tithi.fromJson(Map<String, dynamic> json) => _$TithiFromJson(json);

  Map<dynamic, dynamic> toJson() => _$TithiToJson(this);
}
