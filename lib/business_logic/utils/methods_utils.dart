import 'package:flutter/material.dart';

class MethodUtils {
  static RoundedRectangleBorder getTileShapeBorder(BuildContext context) {
    return RoundedRectangleBorder(
      side: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 0.5,
      ),
    );
  }
}