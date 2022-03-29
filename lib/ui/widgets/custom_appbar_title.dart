import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const CustomAppBarTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title == null
            ? _buildAppLabel()
            : Text(
                title!.toUpperCase(),
                style: GoogleFonts.righteous(),
              ),
        subtitle == null
            ? const SizedBox()
            : Text(
                subtitle!.toUpperCase(),
                style: const TextStyle(fontSize: 14),
              )
      ],
    );
  }

  Widget _buildAppLabel() => Text.rich(
        TextSpan(
          style: GoogleFonts.righteous(),
          children: const [
            TextSpan(
              text: 'FOOTBALL',
            ),
            TextSpan(
              text: '24',
              style: TextStyle(
                color: Color(0xFF9ACD32),
              ),
            ),
          ],
        ),
      );
}
