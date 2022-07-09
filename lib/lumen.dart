library lumen;

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class IdentifyData {
  String? firstName;
  String? lastName;
  String email;
  String? phoneNumber;
  String? deviceId;
  Map<String, dynamic>? attributes;

  IdentifyData(
      {required this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.deviceId,
      this.attributes});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["phone_number"] = phoneNumber;
    data["device_id"] = deviceId;
    data["attributes"] = attributes;

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
      "source": "flutter-plugin",
      "platform": _getPlatform(),
      "properties": data,
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
