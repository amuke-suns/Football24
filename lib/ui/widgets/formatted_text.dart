import 'package:flutter/material.dart';

class FormattedText extends StatelessWidget {
  final String text;

  const FormattedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int colonIndex = text.indexOf(':');

    String beforeColon = colonIndex == -1 ? text : text.substring(0, colonIndex);
    String afterColon = colonIndex == -1 ? '' : text.substring(colonIndex);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: beforeColon,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: afterColon),
        ],
      ),
    );
  }
}
