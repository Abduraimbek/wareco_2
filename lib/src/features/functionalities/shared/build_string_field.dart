import 'package:flutter/material.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

class BuildStringField extends StatelessWidget {
  const BuildStringField({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.italicStyle),
        const SizedBox(height: 5),
        TextField(
          onChanged: onChanged,
        ),
      ],
    );
  }
}
