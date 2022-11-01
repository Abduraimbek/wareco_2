import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zebra_listener_widget.g.dart';

class ZebraListenerWidget extends ConsumerStatefulWidget {
  const ZebraListenerWidget({
    Key? key,
    required this.onZebraListened,
    required this.child,
  }) : super(key: key);

  final void Function(String) onZebraListened;
  final Widget child;

  @override
  ConsumerState createState() => _ZebraListenerWidgetState();
}

class _ZebraListenerWidgetState extends ConsumerState<ZebraListenerWidget> {
  late final StreamSubscription<String> _streamSubscription;

  @override
  void initState() {
    super.initState();

    _streamSubscription = ref
        .read(zebraListenerRepositoryProvider)
        .stream
        .listen(widget.onZebraListened);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

@Riverpod(keepAlive: true)
ZebraListenerRepository zebraListenerRepository(
    ZebraListenerRepositoryRef ref) {
  return ZebraListenerRepository();
}

class ZebraListenerRepository {
  final stream = const EventChannel('yarkinov.abduraimbek/barcode_channel')
      .receiveBroadcastStream()
      .map((event) => event.toString());
}
