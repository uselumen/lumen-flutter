import 'package:lumen/lumen.dart';

void main() {
  // Initialize the plugin with your api key
  final lumen = Lumen("apiKey");

  // Identify

  final identifyData = IdentifyData(
      email: "johndoe@example.com", // required
      first_name: "john",
      last_name: "doe",
      phone_number: "0123456789",
      device_token: "device token");

  lumen.identify("unique user identifier", identifyData);

  // Track

  final customTrackProperties = {"value": "1233"};

  lumen.track("unique user identifier", "event name", customTrackProperties);
}
