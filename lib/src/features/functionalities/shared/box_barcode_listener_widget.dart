import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import 'zebra_listener_widget.dart';

class BoxBarcodeListenerWidget extends StatefulWidget {
  const BoxBarcodeListenerWidget({
    super.key,
    required this.onBarcodeListened,
  });

  final void Function(String) onBarcodeListened;

  @override
  State<BoxBarcodeListenerWidget> createState() =>
      _BoxBarcodeListenerWidgetState();
}

class _BoxBarcodeListenerWidgetState extends State<BoxBarcodeListenerWidget> {
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
        widget.onBarcodeListened(value);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text('Box Barcode:', style: context.italicStyle),
          ),
          TextFormField(
            validator: (value) {
              if (controller.text.isEmpty) {
                return 'Scan Barcode';
              }
              return null;
            },
            onChanged: (value) {
              if (debounce?.isActive ?? false) debounce?.cancel();
              debounce = Timer(const Duration(milliseconds: 1000), () {
                widget.onBarcodeListened(value);
              });
            },
            controller: controller,
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
