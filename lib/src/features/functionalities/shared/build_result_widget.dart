import 'package:flutter/material.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

class BuildResultWidget extends StatelessWidget {
  const BuildResultWidget({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Results:', style: context.italicStyle),
        const SizedBox(height: 2),
        Text(data),
      ],
    );
  }
}
