import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class FavouriteGroupTextContainer extends StatelessWidget {
  final bool isDarkMode;

  const FavouriteGroupTextContainer({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      color: isDarkMode ? Colors.grey[700] : Colors.yellow[200],
      child: Text(
        kFavouriteKey.trim(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.yellow : Colors.black54,
        ),
      ),
    );
  }
}

class FavouriteHeaderTextClicker extends StatelessWidget {
  final bool isDarkMode;
  final String country;
  final String league;
  final String? imageUrl;
  final Function() onTap;

  const FavouriteHeaderTextClicker({
    Key? key,
    required this.isDarkMode,
    required this.country,
    required this.league,
    required this.onTap,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: isDarkMode ? Colors.grey[700] : Colors.yellow[200],
        child: Row(
          children: [
            SvgPicture.network(
              imageUrl ?? '',
              height: 14,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.yellow : Colors.black54
                  ),
                  children: [
                    TextSpan(text: country.toUpperCase() + ': '),
                    TextSpan(
                      text: league.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ],
        ),
      ),
    );

    /*return ListTile(
      dense: true,
      textColor: isDarkMode ? Colors.yellow : Colors.black54,
      tileColor: isDarkMode ? Colors.grey[700] : Colors.yellow[200],
      minLeadingWidth: 5,
      leading: SvgPicture.network(
        imageUrl ?? '',
        height: 14,
      ),
      title: Text.rich(
        TextSpan(
          style: const TextStyle(fontSize: 14),
          children: [
            TextSpan(text: country.toUpperCase() + ': '),
            TextSpan(
              text: league.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
      onTap: onTap(),
    );*/
  }
}

class OthersGroupTextContainer extends StatelessWidget {
  final bool isDarkMode;
  final String text;

  const OthersGroupTextContainer(
      {Key? key, required this.isDarkMode, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white70 : Colors.black45,
        ),
      ),
    );
  }
}
