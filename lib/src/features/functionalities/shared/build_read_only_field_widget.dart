import 'package:flutter/material.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

class BuildReadOnlyFieldWidget extends StatelessWidget {
  const BuildReadOnlyFieldWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title, style: context.italicStyle),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: theme.hintColor,
            ),
            color: theme.splashColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(value),
        ),
      ],
    );
  }
}
