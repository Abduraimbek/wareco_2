import 'package:flutter/material.dart';

class BuildTextAndTextField extends StatelessWidget {
  const BuildTextAndTextField({
    Key? key,
    required this.label,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.none,
    this.autofocus = false,
    this.bottomPadding = false,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool bottomPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ? 20 : 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label:',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              autofocus: autofocus,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
