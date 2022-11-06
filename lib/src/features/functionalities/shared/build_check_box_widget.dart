import 'package:flutter/material.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

class BuildCheckBoxWidget extends StatelessWidget {
  const BuildCheckBoxWidget({
    super.key,
    required this.title,
    required this.checked,
    required this.onChanged,
  });

  final String title;
  final bool checked;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title, style: context.italicStyle),
      value: checked,
      onChanged: (_) => onChanged(),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
