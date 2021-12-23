import 'package:json_annotation/json_annotation.dart';
import 'package:tak_task/models/nakshatra.dart';
import 'package:tak_task/models/tithi.dart';

part 'panchang.g.dart';

@JsonSerializable()
class Panchang {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? vedicRise;
  String? vedicSet;
  Tithi? tithi;
  Nakshatra? nakshatra;

  Panchang(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.vedicRise,
      this.vedicSet,
      this.nakshatra,
      this.tithi});
  factory Panchang.fromJson(Map<String, dynamic> json) =>
      _$PanchangFromJson(json);

  Map<dynamic, dynamic> toJson() => _$PanchangToJson(this);
}
