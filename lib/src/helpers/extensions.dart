import 'package:flutter/material.dart';

extension MyExtensionsOnContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  TextStyle? get italicStyle =>
      Theme.of(this).textTheme.bodyText2?.copyWith(fontStyle: FontStyle.italic);

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
