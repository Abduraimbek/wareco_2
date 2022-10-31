import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

class AutoPalletizeView extends ConsumerWidget {
  const AutoPalletizeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lan = ref.watch(languageProvider);

    return FunctionalityPageScaffold(
      loading: false,
      children: [
        BuildTextAndTextField(
          label: lan.inventory,
          bottomPadding: true,
        ),
        BuildTextAndTextField(
          label: lan.palletId,
        ),
      ],
    );
  }
}
