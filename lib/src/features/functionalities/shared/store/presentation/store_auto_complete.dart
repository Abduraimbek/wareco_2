import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import 'stores_controller.dart';

class StoreAutoComplete extends ConsumerWidget {
  const StoreAutoComplete({
    super.key,
    required this.onStoreNoChanged,
  });

  final void Function(int) onStoreNoChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stores = ref.watch(storesControllerProvider);
    final storeList = stores.value ?? [];
    final storeNumbersInString = storeList.map((e) => e.number.toString());

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Store No:', style: context.italicStyle),
        const SizedBox(height: 5),
        Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            final number = int.tryParse(textEditingValue.text) ?? 0;
            onStoreNoChanged(number);

            if (textEditingValue.text == '') {
              return storeNumbersInString;
            }
            return storeNumbersInString.where((e) =>
                e.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (option) {
            final number = int.tryParse(option) ?? 0;
            onStoreNoChanged(number);
          },
          optionsMaxHeight: context.height * .5,
        ),
      ],
    );
  }
}
