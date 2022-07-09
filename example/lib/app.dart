import 'package:flutter/material.dart';
import 'package:lumen/lumen.dart';
import 'package:lumen_flutter_example/widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  identifyUser() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const Text(
            "Lumen Test App",
          ),
          backgroundColor: primaryColor),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Section(),
                  const LargeText(title: "Information"),
                  LabelValueRow(label: "API KEY:  ", value: Lumen.apiKey),
                  const LabelValueRow(
                      label: "Environment:  ", value: "PRODUCTION"),
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  LargeText(title: "User Identification"),
                  LabelValueRow(
                      label: "User ID:  ", value: "IDHDIDOD-DJDODKDJDD-JSJS"),
                  LabelValueRow(label: "Email:  ", value: "johndoe@gmail.com"),
                  LabelValueRow(label: "First Name:  ", value: "John"),
                  LabelValueRow(
                      label: "Phone Number:  ", value: "+2347053643618"),
                  TrackButton(label: "Identify User", event: "Omoo"),
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  LargeText(title: "Event Tracking"),
                  TrackButton(
                      label: "Track 'Clicked Login'", event: "Clicked Login"),
                  TrackButton(
                      label: "Track 'Clicked Logout'", event: "Clicked Logout"),
                ],
              )
            ],
          )),
    );
  }
}

void logEvents() {
  Lumen.init("apiKey");

  // Identify

  final identifyData = IdentifyData(
      email: "johndoe@example.com", // required
      first_name: "john",
      last_name: "doe",
      phone_number: "0123456789",
      device_token: "device token");

  Lumen.identify("unique user identifier", identifyData);

  // Track

  final customTrackProperties = {"value": "1233"};

  Lumen.track("unique user identifier", "event name", customTrackProperties);
}
