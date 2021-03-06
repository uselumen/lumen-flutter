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

class CustomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const CustomButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Section(
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor)),
            child: Text(label))));
  }
}
