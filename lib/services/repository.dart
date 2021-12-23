import 'package:tak_task/models/astrologer.dart';
import 'package:tak_task/models/location.dart';
import 'package:tak_task/models/panchang.dart';
import 'package:tak_task/services/api_services.dart';

class Repository {
  final apiServices = APIServices();
  Repository();
  Future<List<Astrologer>> fetchAstrologers(String querys) async {
    await Future.delayed(const Duration(seconds: 1));
    final astrologers = await apiServices.getAstrologer();
    return astrologers.map((e) => Astrologer.fromJson(e)).where((element) {
      final fname = element.firstName?.toLowerCase();
      final lname = element.lastName?.toLowerCase();
      final language = element.languages?.join('').toLowerCase();
      final skills = element.skills?.join('').toLowerCase();
      final query = querys.toLowerCase();

      return fname!.contains(query) ||
          lname!.contains(query) ||
          language!.contains(query) ||
          skills!.contains(query);
    }).toList();
  }

  Future<List<Location>> fetchLocation() async {
    final locations = await apiServices.getLocation();
    return locations.map((e) => Location.fromJson(e)).toList();
  }

  Future<Panchang> fetchPanchang(DateTime date, String placeId) async {
    final panchang = await apiServices.getPanchang(date, placeId);
    return Panchang.fromJson(panchang);
  }
}
