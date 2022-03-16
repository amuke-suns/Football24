import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'formatted_text.dart';

class CompetitionCard extends StatelessWidget {
  final String? imageUrl;
  final String text;
  final int? total;

  const CompetitionCard({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.network(
          imageUrl ?? '',
          width: 30,
          height: 20,
        ),
        const SizedBox(width: 10),
        Expanded(child: FormattedText(text: text)),
        total == null
            ? const SizedBox()
            : Text(total.toString())
      ],
    );
  }
}
