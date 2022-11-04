import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

final locationKey = GlobalKey<FormState>();

class LocationDropDown extends ConsumerWidget {
  const LocationDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lan = ref.watch(languageProvider);

    final locations = ref.watch(locationsControllerProvider);
    final selectedLocation = ref.watch(selectedLocationControllerProvider);

    final list = locations.value ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text('Location:', style: context.italicStyle),
        ),
        Form(
          key: locationKey,
          child: DropdownButtonFormField<LocationModel?>(
            validator: (value) {
              if (value == null) {
                return 'Select Location';
              } else {
                return null;
              }
            },
            value: selectedLocation,
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
                .read(selectedLocationControllerProvider.notifier)
                .selectLocation,
          ),
        ),
      ],
    );
  }
}
