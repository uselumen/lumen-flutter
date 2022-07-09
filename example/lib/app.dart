import 'package:flutter/material.dart';
import 'package:lumen/lumen.dart';
import 'package:lumen_flutter_example/widgets.dart';

String userId = "dhdohejeoeoeee";
String userEmail = "johndoe1234@example.com";
String userFirstName = "john";
String userPhoneNumber = "+2340000000001";

Map<String, dynamic> userAtttributes = {
  "age": 20,
  "hasCompletedVerification": false
};

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
            firstName: userFirstName,
            phoneNumber: userPhoneNumber,
            attributes: userAtttributes));
  }

  trackEvent(String eventName, [Map<String, dynamic> properties = const {}]) {
    Lumen.track(userId, eventName, properties);
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
                      label: "Track - Clicked 'Add To Cart'",
                      onPressed: () {
                        trackEvent("Clicked 'Add To Cart'",
                            {"sku": "skksosownw", "category": "electronics"});
                      }),
                  CustomButton(
                      label: "Track - Clicked 'Logout'",
                      onPressed: () {
                        trackEvent("Clicked 'Logout'");
                      }),
                ],
              )
            ],
          )),
    );
  }
}
