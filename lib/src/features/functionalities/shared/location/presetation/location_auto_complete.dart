import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import 'locations_controller.dart';

class LocationAutoComplete extends ConsumerWidget {
  const LocationAutoComplete({
    super.key,
    required this.onLocationChanged,
  });

  final void Function(int) onLocationChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationsControllerProvider);
    final list = locations.value ?? [];
    final locationsInString = list.map((e) => e.number.toString());

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location', style: context.italicStyle),
        const SizedBox(height: 5),
        Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            final number = int.tryParse(textEditingValue.text) ?? 0;
            onLocationChanged(number);

            if (textEditingValue.text == '') {
              return locationsInString;
            }
            return locationsInString.where((e) =>
                e.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (option) {
            final number = int.tryParse(option) ?? 0;
            onLocationChanged(number);
          },
          optionsMaxHeight: context.height * .5,
        ),
      ],
    );
  }
}
