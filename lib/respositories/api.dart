import 'dart:convert';

import 'package:astrologer/view/astrologer/view/astrologer.dart';
import 'package:http/http.dart' as http;

Future<AstrologerModel> getAstrologers() async {
  var url = Uri.parse('https://www.astrotak.com/astroapi/api/agent/all');
  var response = await http.get(url);
  return AstrologerModel.fromJson(jsonDecode(response.body));
}

Future<AstrologerModel> getLocation(String location) async {
  var url = Uri.parse(
      'https://www.astrotak.com/astroapi/api/location/place?inputPlace=' +
          location);
  var response = await http.get(url);
  return AstrologerModel.fromJson(jsonDecode(response.body));
}

Future<AstrologerModel> getPanchang(String location) async {
  var url = Uri.parse(
      'https://www.astrotak.com/astroapi/api/horoscope/daily/panchang');
  var response = await http.get(url);
  return AstrologerModel.fromJson(jsonDecode(response.body));
}
