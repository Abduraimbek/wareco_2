import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

class CreateVsrView extends ConsumerWidget {
  const CreateVsrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      enterPressed: () {},
      clearPressed: () {},
      children: const [],
    );
  }
}
