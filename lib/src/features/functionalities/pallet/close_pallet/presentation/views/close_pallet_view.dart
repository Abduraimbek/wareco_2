import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

import 'build_close_by_last_box.dart';

class ClosePalletView extends ConsumerWidget {
  const ClosePalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lan = ref.watch(languageProvider);

    return FunctionalityPageScaffold(
      loading: false,
      children: [
        const BuildCloseByLastBox(),
        BuildTextAndTextField(
          label: lan.palletId,
          bottomPadding: true,
        ),
        BuildTextAndTextField(
          label: lan.boxBarcode,
          bottomPadding: true,
        ),
        BuildTextAndTextField(
          label: lan.newPalletBarcode,
        ),
      ],
    );
  }
}
