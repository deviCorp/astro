import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String? placeName;
  String? placeId;
  Location({this.placeName, this.placeId});
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<dynamic, dynamic> toJson() => _$LocationToJson(this);
}
