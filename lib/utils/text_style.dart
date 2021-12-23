import 'package:flutter/material.dart';

TextStyle headingStyle(
    {required BuildContext context,
    required double size,
    required Color color}) {
  return Theme.of(context)
      .textTheme
      .headline1!
      .copyWith(fontSize: size, color: color);
}

TextStyle bodyStyle(
    {required BuildContext context,
    required double size,
    required Color color}) {
  return Theme.of(context)
      .textTheme
      .bodyText1!
      .copyWith(fontSize: size, color: color);
}
