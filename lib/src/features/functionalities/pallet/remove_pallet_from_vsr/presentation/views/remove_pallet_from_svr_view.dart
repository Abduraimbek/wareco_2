import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

class RemovePalletFromVsrView extends ConsumerStatefulWidget {
  const RemovePalletFromVsrView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RemovePalletFromVsrViewState();
}

class _RemovePalletFromVsrViewState
    extends ConsumerState<RemovePalletFromVsrView> {
  @override
  Widget build(BuildContext context) {
    return FunctionalityPageScaffold(
      okPressed: () {},
      resetPressed: () {},
      children: const [],
    );
  }
}
