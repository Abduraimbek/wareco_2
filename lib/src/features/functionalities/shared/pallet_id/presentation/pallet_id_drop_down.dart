import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

final palletIdKey = GlobalKey<FormState>();

class PalletIdDropDown extends ConsumerWidget {
  const PalletIdDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lan = ref.watch(languageProvider);

    final palletIds = ref.watch(palletIdsControllerProvider);
    final selectedPalletId = ref.watch(selectedPalletIdControllerProvider);

    final list = palletIds.value ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            'Pallet ID:',
            style: context.italicStyle,
          ),
        ),
        Form(
          key: palletIdKey,
          child: DropdownButtonFormField<PalletIdModel?>(
            validator: (value) {
              if (value == null) {
                return 'Select Pallet ID';
              } else {
                return null;
              }
            },
            value: selectedPalletId,
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
            onChanged: ref
                .read(selectedPalletIdControllerProvider.notifier)
                .selectPalletId,
          ),
        ),
      ],
    );
  }
}
