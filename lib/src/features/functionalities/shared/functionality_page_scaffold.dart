import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/helpers/extensions.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../home/home.dart';

part 'functionality_page_scaffold.g.dart';

class FunctionalityPageScaffold extends ConsumerStatefulWidget {
  const FunctionalityPageScaffold({
    super.key,
    required this.enterPressed,
    required this.clearPressed,
    required this.children,
    this.withSingleChildScrollView = true,
  });

  final FutureOr Function() enterPressed;
  final VoidCallback clearPressed;
  final List<Widget> children;
  final bool withSingleChildScrollView;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FunctionalityPageScaffoldState();
}

class _FunctionalityPageScaffoldState
    extends ConsumerState<FunctionalityPageScaffold> {
  bool loading = false;
  bool clearPressed = false;

  @override
  Widget build(BuildContext context) {
    final selectedFunction = ref.watch(selectedFunctionProvider);

    ref.listen(wifiStatusProvider, (previous, next) {
      if (next == WifiConnectionStatus.notConnected) {
        context.showSnackBar('WiFi not connected.');
      }
    });

    return WillPopScope(
      onWillPop: () async => !loading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(selectedFunction.text),
        ),
        body: Column(
          children: [
            Expanded(
              child: widget.withSingleChildScrollView
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 20,
                        bottom: 50,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: clearPressed ? [] : widget.children,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: clearPressed ? [] : widget.children,
                      ),
                    ),
            ),
            Row(
              children: [
                const SizedBox(width: 14),
                Expanded(
                  child: MyMaxWidthButton(
                    onPressed: loading ? null : _backPressed,
                    text: 'BACK',
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: MyMaxWidthButton(
                    onPressed: loading ? null : _clearPressed,
                    text: 'CLEAR',
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: MyMaxWidthButton(
                    onPressed: loading ? null : _enterPressed,
                    text: 'ENTER',
                  ),
                ),
                const SizedBox(width: 14),
              ],
            ),
            const SafeArea(
              child: SizedBox(height: 25),
            ),
          ],
        ),
      ),
    );
  }

  void _backPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop();
  }

  Future<void> _clearPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();

    widget.clearPressed();

    setState(() {
      clearPressed = true;
    });

    await Future.delayed(const Duration(milliseconds: 10));

    if (!mounted) return;

    setState(() {
      clearPressed = false;
    });
  }

  Future<void> _enterPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      loading = true;
    });

    await widget.enterPressed();

    if (!mounted) return;

    setState(() {
      loading = false;
    });
  }
}

@Riverpod(keepAlive: true)
class WifiStatus extends _$WifiStatus {
  @override
  WifiConnectionStatus build() {
    return WifiConnectionStatus.notChecked;
  }

  Future<bool> checkConnection() async {
    state = WifiConnectionStatus.checking;

    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      state = WifiConnectionStatus.connected;
    } else {
      state = WifiConnectionStatus.notConnected;
    }

    return state == WifiConnectionStatus.connected;
  }
}

enum WifiConnectionStatus { connected, notConnected, notChecked, checking }
