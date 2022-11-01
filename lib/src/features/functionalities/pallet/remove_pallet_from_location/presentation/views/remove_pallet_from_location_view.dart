import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

class RemovePalletFromLocationView extends ConsumerStatefulWidget {
  const RemovePalletFromLocationView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RemovePalletFromLocationViewState();
}

class _RemovePalletFromLocationViewState
    extends ConsumerState<RemovePalletFromLocationView> {
  final _palletIdController = TextEditingController();
  final _palletFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _palletFocusNode.addListener(_palletListener);
  }

  @override
  void dispose() {
    _palletFocusNode.removeListener(_palletListener);
    _palletFocusNode.dispose();
    _palletIdController.dispose();
    super.dispose();
  }

  void _palletListener() {
    if (!_palletFocusNode.hasFocus) {
      _palletFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lan = ref.watch(languageProvider);

    return FunctionalityPageScaffold(
      loading: false,
      children: [
        BuildTextAndTextField(
          label: lan.palletId,
          controller: _palletIdController,
          focusNode: _palletFocusNode,
          autofocus: true,
        ),
      ],
    );
  }
}
