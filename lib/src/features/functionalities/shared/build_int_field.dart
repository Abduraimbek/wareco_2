import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

class BuildIntField extends StatelessWidget {
  const BuildIntField({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.italicStyle),
        const SizedBox(height: 5),
        TextField(
          onChanged: (value) {
            final number = int.tryParse(value) ?? 0;
            onChanged(number);
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
