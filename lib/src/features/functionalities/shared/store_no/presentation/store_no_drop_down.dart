import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

final storeNoKey = GlobalKey<FormState>();

class StoreNoDropDown extends ConsumerWidget {
  const StoreNoDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lan = ref.watch(languageProvider);

    final storeNos = ref.watch(storeNosControllerProvider);
    final selectedStoreNo = ref.watch(selectedStoreNoControllerProvider);

    final list = storeNos.value ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text('Store No:', style: context.italicStyle),
        ),
        Form(
          key: storeNoKey,
          child: DropdownButtonFormField<StoreNoModel?>(
            validator: (value) {
              if (value == null) {
                return 'Select Store No.';
              } else {
                return null;
              }
            },
            value: selectedStoreNo,
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
                .read(selectedStoreNoControllerProvider.notifier)
                .selectStoreNo,
          ),
        ),
      ],
    );
  }
}
