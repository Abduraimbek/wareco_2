import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

final newPalletIdKey = GlobalKey<FormState>();

class NewPalletIdDropDown extends ConsumerWidget {
  const NewPalletIdDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lan = ref.watch(languageProvider);

    final newPalletIds = ref.watch(newPalletIdsControllerProvider);
    final selectedNewPalletId =
        ref.watch(selectedNewPalletIdControllerProvider);

    final list = newPalletIds.value ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            'New Pallet ID:',
            style: context.italicStyle,
          ),
        ),
        Form(
          key: newPalletIdKey,
          child: DropdownButtonFormField<NewPalletIdModel?>(
            validator: (value) {
              if (value == null) {
                return 'Select New Pallet ID';
              } else {
                return null;
              }
            },
            value: selectedNewPalletId,
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
                .read(selectedNewPalletIdControllerProvider.notifier)
                .selectNewPalletId,
          ),
        ),
      ],
    );
  }
}
