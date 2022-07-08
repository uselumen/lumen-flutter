// ignore_for_file: non_constant_identifier_names

library lumen_flutter;

import 'dart:io';

import 'package:lumen_flutter/constants.dart';
import 'package:http/http.dart' as http;

class IdentifyData {
  String? first_name;
  String? last_name;
  String email;
  String? phone_number;
  Map<String, Object>? properties;

  IdentifyData(
      {required this.email,
      this.first_name,
      this.last_name,
      this.phone_number,
      this.properties});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first_name"] = first_name;
    data["last_name"] = last_name;
    data["email"] = email;
    data["phone_number"] = phone_number;
    data["properties"] = properties;

    return data;
  }
}

// class TrackData {
//   String identifier;
//   String? platform;
//   String? device_id;
//   Map<String, Object>? properties;

//   TrackData(
//       {required this.identifier,
//       this.device_id,
//       this.platform,
//       this.properties});

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["identifier"] = identifier;
//     data["platform"] = platform;
//     data["device_id"] = device_id;
//     data["properties"] = properties;

//     return data;
//   }
// }

class Lumen {
  final String apiKey;

  Lumen(this.apiKey);

  Future<void> _request(String url, Map<String, dynamic> payload) async {
    String absolutePath = apiBaseUrl + url;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "api_key": apiKey,
    };

    final response = await http.post(Uri.parse(absolutePath),
        body: payload, headers: headers);

    if (response.statusCode != 200) {
      throw Exception("Error fetching data");
    }
  }

  Future<void> identify(String identifier, IdentifyData data) async {
    final jsonData = data.toJson();

    if (Platform.isAndroid) {
      jsonData["platform"] = "android";
    } else if (Platform.isIOS) {
      jsonData["platform"] = "ios";
    }

    await _request("/", jsonData);
  }

  Future track(String id, String event, Map<String, dynamic> data) async {
    await _request("/", data);
  }
}
