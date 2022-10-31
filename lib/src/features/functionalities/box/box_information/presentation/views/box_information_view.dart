import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/home/home.dart';

class BoxInformation extends ConsumerWidget {
  const BoxInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const FunctionalityPageScaffold(
      loading: false,
      children: [],
    );
  }
}
