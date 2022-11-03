import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

class StockTakeView extends ConsumerStatefulWidget {
  const StockTakeView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _StockTakeState();
}

class _StockTakeState extends ConsumerState<StockTakeView> {
  @override
  Widget build(BuildContext context) {
    return const FunctionalityPageScaffold(
      loading: false,
      children: [
        InventoryDropDown(),
      ],
    );
  }
}
