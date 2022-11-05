import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

final vsrNoKey = GlobalKey<FormState>();

class VsrNoDropDown extends ConsumerWidget {
  const VsrNoDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lan = ref.watch(languageProvider);

    final vsrNos = ref.watch(vsrNosControllerProvider);
    final selectedVsrNo = ref.watch(selectedVsrNoControllerProvider);

    final list = vsrNos.value ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text('VSR No.:', style: context.italicStyle),
        ),
        Form(
          key: vsrNoKey,
          child: DropdownButtonFormField<VsrNoModel?>(
            validator: (value) {
              if (value == null) {
                return 'Select VSR No.';
              } else {
                return null;
              }
            },
            value: selectedVsrNo,
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
            onChanged:
                ref.read(selectedVsrNoControllerProvider.notifier).selectVsrNo,
          ),
        ),
      ],
    );
  }
}
