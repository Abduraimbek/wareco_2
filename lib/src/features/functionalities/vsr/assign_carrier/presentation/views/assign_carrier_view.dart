import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

class AssignCarrierView extends ConsumerWidget {
  const AssignCarrierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const FunctionalityPageScaffold(
      loading: false,
      children: [],
    );
  }
}
