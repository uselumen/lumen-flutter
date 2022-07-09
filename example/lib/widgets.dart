// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF625df4);

class LargeText extends StatelessWidget {
  final String title;

  const LargeText({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Section(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ],
    )));
  }
}

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueRow({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Section(
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    ));
  }
}

class Section extends StatelessWidget {
  final Widget? child;

  const Section({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: child,
    ));
  }
}

class TrackButton extends StatelessWidget {
  final String label;
  final String event;

  const TrackButton({
    required this.label,
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Section(
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor)),
            child: Text(label))));
  }
}
