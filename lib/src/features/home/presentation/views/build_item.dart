import 'package:flutter/material.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: MyMaxWidthButton(
        onPressed: onPressed,
        text: title,
      ),
    );
  }
}
