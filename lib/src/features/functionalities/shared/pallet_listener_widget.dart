import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

class PalletListenerWidget extends StatefulWidget {
  const PalletListenerWidget({
    super.key,
    required this.onPalletIdListened,
  });

  final void Function(String) onPalletIdListened;

  @override
  State<PalletListenerWidget> createState() => _PalletListenerWidgetState();
}

class _PalletListenerWidgetState extends State<PalletListenerWidget> {
  late final TextEditingController controller;
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    debounce?.cancel();
    debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZebraListenerWidget(
      onZebraListened: (value) {
        controller.text = value;
        widget.onPalletIdListened(value);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text('Pallet ID:', style: context.italicStyle),
          ),
          TextField(
            onChanged: (value) {
              if (debounce?.isActive ?? false) debounce?.cancel();
              debounce = Timer(const Duration(milliseconds: 800), () {
                widget.onPalletIdListened(value);
              });
            },
            controller: controller,
          ),
        ],
      ),
    );
  }
}
