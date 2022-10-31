import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

class RemovePalletFromVsrView extends ConsumerStatefulWidget {
  const RemovePalletFromVsrView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RemovePalletFromVsrViewState();
}

class _RemovePalletFromVsrViewState
    extends ConsumerState<RemovePalletFromVsrView> {
  @override
  Widget build(BuildContext context) {
    final lan = ref.watch(languageProvider);

    return FunctionalityPageScaffold(
      loading: false,
      children: [
        BuildTextAndTextField(label: lan.palletBarcode),
      ],
    );
  }
}
