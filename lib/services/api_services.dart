import 'package:http/http.dart' as http;
import 'dart:convert';

class APIServices {
  static String base = 'https://www.astrotak.com/astroapi/api';
  Future<List> getAstrologer() async {
    var response = await http.get(
      Uri.parse('$base/agent/all'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'] as List;
    } else {
      throw Exception();
    }
  }

  Future<List> getLocation() async {
    var response = await http.get(
      Uri.parse('$base/location/place?inputPlace=Delhi'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'] as List;
    } else {
      throw Exception();
    }
  }

  Future getPanchang(DateTime date, String placeId) async {
    var response = await http.post(Uri.parse('$base/horoscope/daily/panchang'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(<String, dynamic>{
          "day": date.day,
          "month": date.month,
          "year": date.year,
          "placeId": placeId
        }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception();
    }
  }
}
