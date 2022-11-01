import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

import '../../home/home.dart';

class FunctionalityPageScaffold extends ConsumerWidget {
  const FunctionalityPageScaffold({
    Key? key,
    required this.loading,
    required this.children,
    this.withSingleChildScrollView = false,
    this.resetPressed,
    this.submitPressed,
  }) : super(key: key);

  final List<Widget> children;
  final bool loading;
  final bool withSingleChildScrollView;
  final VoidCallback? resetPressed;
  final VoidCallback? submitPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lan = ref.watch(languageProvider);
    final selectedFunction = ref.watch(selectedFunctionProvider);

    return WillPopScope(
      onWillPop: () async => !loading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text((selectedFunction?.titleEn ?? '').toUpperCase()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: MyMaxWidthButton(
                onPressed: loading ? null : () => Navigator.of(context).pop(),
                text: lan.back,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: MyMaxWidthButton(
                onPressed: loading ? null : resetPressed,
                text: lan.reset,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: MyMaxWidthButton(
                onPressed: loading ? null : submitPressed,
                text: lan.submit,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: withSingleChildScrollView
            ? SingleChildScrollView(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
      ),
    );
  }
}
