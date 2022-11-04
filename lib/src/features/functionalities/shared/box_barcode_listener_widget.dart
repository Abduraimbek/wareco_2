import 'package:flutter/material.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import 'zebra_listener_widget.dart';

final barcodeKey = GlobalKey<FormState>();

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
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
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
          Form(
            key: barcodeKey,
            child: TextFormField(
              validator: (value) {
                if (controller.text.isEmpty) {
                  return 'Scan Barcode';
                }
                return null;
              },
              onChanged: (value) {
                widget.onBarcodeListened(value);
              },
              controller: controller,
              keyboardType: TextInputType.multiline,
              minLines: 2,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
