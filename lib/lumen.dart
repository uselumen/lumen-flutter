// ignore_for_file: non_constant_identifier_names

library lumen;

import 'dart:io';

import 'package:http/http.dart' as http;

class IdentifyData {
  String? first_name;
  String? last_name;
  String email;
  String? phone_number;
  String? device_token;
  Map<String, Object>? properties;

  IdentifyData(
      {required this.email,
      this.first_name,
      this.last_name,
      this.phone_number,
      this.device_token,
      this.properties});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first_name"] = first_name;
    data["last_name"] = last_name;
    data["email"] = email;
    data["phone_number"] = phone_number;
    data["device_token"] = device_token;
    data["properties"] = properties;

    return data;
  }
}

class Lumen {
  final String apiKey;
  static const _baseUrl = "https://api.uselumen.co/v1";

  Lumen(this.apiKey);

  Future<void> _request(String url, Map<String, dynamic> payload) async {
    String absolutePath = _baseUrl + url;

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

  Future<void> identify(String userId, IdentifyData data) async {
    final jsonData = data.toJson();

    if (Platform.isAndroid) {
      jsonData["platform"] = "android";
    } else if (Platform.isIOS) {
      jsonData["platform"] = "ios";
    }

    await _request("/customer/identify", jsonData);
  }

  Future track(String userId, String event, Map<String, dynamic> data) async {
    await _request("/event/track", data);
  }
}
