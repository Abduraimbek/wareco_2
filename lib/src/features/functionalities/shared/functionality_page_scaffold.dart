import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/helpers/extensions.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../home/home.dart';

part 'functionality_page_scaffold.g.dart';

class FunctionalityPageScaffold extends ConsumerWidget {
  const FunctionalityPageScaffold({
    super.key,
    required this.okPressed,
    required this.resetPressed,
    required this.children,
  });

  final VoidCallback okPressed;
  final VoidCallback resetPressed;
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingProvider);
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 20,
                  bottom: 50,
                ),
                child: Consumer(
                  builder: (context, ref, _) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ref.watch(resetPressedProvider) ? [] : children,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: MyMaxWidthButton(
                      onPressed:
                          loading ? null : () => Navigator.of(context).pop(),
                      text: 'BACK',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MyMaxWidthButton(
                      onPressed: loading
                          ? null
                          : () {
                              ref
                                  .read(resetPressedProvider.notifier)
                                  .onResetPressed();
                              resetPressed();
                            },
                      text: 'RESET',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MyMaxWidthButton(
                      onPressed: loading ? null : okPressed,
                      text: 'OK',
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@Riverpod(keepAlive: true)
class ResetPressed extends _$ResetPressed {
  @override
  bool build() {
    return false;
  }

  Future<void> onResetPressed() async {
    if (!state) {
      state = true;
      await Future.delayed(const Duration(milliseconds: 10));
      state = false;
    }
  }
}

@Riverpod(keepAlive: true)
class Loading extends _$Loading {
  @override
  bool build() {
    return false;
  }

  void loadingTRUE() {
    state = true;
  }

  void loadingFALSE() {
    state = false;
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
