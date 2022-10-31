import 'package:flutter/material.dart';

class MyMaxWidthButton extends StatelessWidget {
  const MyMaxWidthButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: Text(text.toUpperCase()),
    );
  }
}
