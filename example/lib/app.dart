import 'package:flutter/material.dart';
import 'package:lumen/lumen.dart';
import 'package:lumen_flutter_example/widgets.dart';

String userId = "popuduhjenjiejbeneeieue";
String userEmail = "johndoe123@gmail.com";
String userFirstName = "john";
String userPhoneNumber = "+2340012345678";

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
    Lumen.identify(
        userId,
        IdentifyData(
            email: userEmail,
            first_name: userFirstName,
            phone_number: userPhoneNumber,
            properties: {}));
  }

  trackEvent(String eventName) {
    Lumen.track(
      userId,
      eventName,
    );
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
                children: [
                  const LargeText(title: "User Identification"),
                  LabelValueRow(label: "User ID:  ", value: userId),
                  LabelValueRow(label: "Email:  ", value: userEmail),
                  LabelValueRow(label: "First Name:  ", value: userFirstName),
                  LabelValueRow(
                      label: "Phone Number:  ", value: userPhoneNumber),
                  CustomButton(
                    label: "Identify User",
                    onPressed: () {
                      identifyUser();
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LargeText(title: "Event Tracking"),
                  CustomButton(
                      label: "Track 'Clicked Login'",
                      onPressed: () {
                        trackEvent("Clicked Login");
                      }),
                  CustomButton(
                      label: "Track 'Clicked Logout'",
                      onPressed: () {
                        trackEvent("Clicked Logout");
                      }),
                ],
              )
            ],
          )),
    );
  }
}
