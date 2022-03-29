import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_news/business_logic/utils/constants.dart';

class FavouriteGroupHeader extends StatelessWidget {
  final bool isDarkMode;

  const FavouriteGroupHeader({
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

class FavouriteFixturesHeader extends StatelessWidget {
  final bool isDarkMode;
  final String country;
  final String league;
  final String? imageUrl;
  final Function() onTap;

  const FavouriteFixturesHeader({
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
                      color: isDarkMode ? Colors.yellow : Colors.black54),
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
  }
}

class OthersGroupHeader extends StatelessWidget {
  final bool isDarkMode;
  final String text;

  const OthersGroupHeader({
    Key? key,
    required this.isDarkMode,
    required this.text,
  }) : super(key: key);

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

class OthersFixturesHeader extends StatelessWidget {
  final bool isDarkMode;
  final String country;
  final String league;
  final String? imageUrl;
  final Function() onTap;

  const OthersFixturesHeader({
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
        width: double.infinity,
        color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
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
                      color: isDarkMode ? Colors.white70 : Colors.black45),
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
  }
}
