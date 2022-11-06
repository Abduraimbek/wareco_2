import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

class BuildStoreNameWidget extends ConsumerWidget {
  const BuildStoreNameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStore = ref.watch(selectedStoreNoControllerProvider);

    return BuildReadOnlyFieldWidget(
      title: 'Store Name:',
      value: selectedStore?.number.toString() ?? '',
    );
  }
}
