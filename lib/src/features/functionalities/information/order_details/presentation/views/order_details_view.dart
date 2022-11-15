import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/order_details_controller.dart';
import 'build_result.dart';

class OrderDetailsView extends ConsumerWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {
        await ref.read(orderDetailsControllerProvider.notifier).pressEnter();
      },
      clearPressed: () {
        ref.invalidate(orderDetailsControllerProvider);
      },
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: StoreAutoComplete(
                onStoreNoChanged: (storeNo) {
                  ref
                      .read(orderDetailsControllerProvider.notifier)
                      .changeStoreNo(storeNo);
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 3,
              child: BuildIntField(
                label: 'PD/DR No.:',
                onChanged: (number) {
                  ref
                      .read(orderDetailsControllerProvider.notifier)
                      .changePoDrNo(number);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        BuildIntField(
          label: 'Vendor:',
          onChanged: (number) {
            ref
                .read(orderDetailsControllerProvider.notifier)
                .changeVendor(number);
          },
        ),
        const SizedBox(height: 20),
        const Expanded(
          child: BuildResult(),
        ),
      ],
    );
  }
}
