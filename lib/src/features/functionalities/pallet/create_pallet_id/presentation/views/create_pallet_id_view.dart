import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

class CreatePalletIdView extends ConsumerWidget {
  const CreatePalletIdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lan = ref.watch(languageProvider);
    final theme = Theme.of(context);

    return FunctionalityPageScaffold(
      loading: false,
      children: [
        BuildTextAndTextField(
          label: lan.palletId,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'User id',
            style: theme.textTheme.titleMedium,
          ),
        ),
        BuildTextAndTextField(
          label: lan.quantity,
        ),
        const Text(''),
      ],
    );
  }
}
