import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

class InventoryDropDown extends ConsumerWidget {
  const InventoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lan = ref.watch(languageProvider);
    final inventories = ref.watch(inventoriesControllerProvider);
    final selectedInventory = ref.watch(selectedInventoryControllerProvider);

    final list = inventories.value ?? [];

    return Row(
      children: [
        Expanded(
          child: Text(
            lan.inventory,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: DropdownButtonFormField<InventoryModel?>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            isDense: true,
            value: selectedInventory,
            onChanged: ref
                .read(selectedInventoryControllerProvider.notifier)
                .selectInventory,
            items: [
              DropdownMenuItem(
                value: null,
                child: Text(
                  lan.notSelected,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: theme.hintColor),
                ),
              ),
              for (final e in list)
                DropdownMenuItem(
                  value: e,
                  child: Text(e.number.toString()),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
