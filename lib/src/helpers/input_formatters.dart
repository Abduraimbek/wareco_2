import 'package:flutter/services.dart';

TextInputFormatter decimalInputFormatter() {
  return FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'));
}
