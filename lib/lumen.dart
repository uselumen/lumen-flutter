// ignore_for_file: non_constant_identifier_names

library lumen;

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class IdentifyData {
  String? first_name;
  String? last_name;
  String email;
  String? phone_number;
  String? device_id;
  Map<String, Object>? properties;

  IdentifyData(
      {required this.email,
      this.first_name,
      this.last_name,
      this.phone_number,
      this.device_id,
      this.properties});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first_name"] = first_name;
    data["last_name"] = last_name;
    data["email"] = email;
    data["phone_number"] = phone_number;
    data["device_id"] = device_id;
    data["properties"] = properties;

    return data;
  }
}

class Lumen {
  static String apiKey = "";
  static bool showDebugMessages = true;
  static const _baseUrl = "https://api.uselumen.co/v1";

  static void init(String lumenApiKey, [bool debug = true]) {
    apiKey = lumenApiKey;
    showDebugMessages = debug;
  }

  static Future<void> identify(String identifier, IdentifyData data) async {
    if (apiKey == "") {
      _customPrint("Plugin must be initialized before use.");
    }

    final jsonData = data.toJson();

    jsonData["identifier"] = identifier;

    _customPrint(" Identifying user '$identifier'");

    await _request("/customer/identify", jsonData);
  }

  static Future track(String identifier, String eventName,
      [Map<String, dynamic> data = const {}]) async {
    if (apiKey == "") {
      throw Exception("Plugin must be initialized before use");
    }

    Map<String, dynamic> payload = {
      "identifier": identifier,
      "event_name": eventName,
      "properties": data,
      "source": "flutter-plugin",
      "platform": _getPlatform(),
    };

    _customPrint("Sending event '$eventName'");
    await _request("/event/track", payload);
  }

  static Future<void> _request(String url, Map<String, dynamic> payload) async {
    String absolutePath = _baseUrl + url;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "api_key": apiKey,
    };

    try {
      final response = await http.post(Uri.parse(absolutePath),
          body: jsonEncode(payload), headers: headers);

      if (response.statusCode != 200) {
        throw Exception(response.body.toString());
      }
    } catch (e) {
      _customPrint(e);
    }
  }

  static String _getPlatform() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "iOS";
    }
    return "Others";
  }

  static _customPrint(dynamic message, [bool error = false]) {
    if (!showDebugMessages) return;

    if (kDebugMode) {
      String messageIcon = error ? "🟥" : "🟦";
      print("$messageIcon $message");
    }
  }
}
