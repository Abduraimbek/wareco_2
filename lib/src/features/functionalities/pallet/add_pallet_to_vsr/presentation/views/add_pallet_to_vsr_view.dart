import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/add_pallet_to_vsr_controller.dart';

class AddPalletToVsrView extends ConsumerWidget {
  const AddPalletToVsrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      okPressed: () async {
        if (storeNoKey.currentState!.validate() &&
            vsrNoKey.currentState!.validate() &&
            palletIdKey.currentState!.validate()) {
          await ref.read(addPalletToVsrControllerProvider.notifier).okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(addPalletToVsrControllerProvider);
      },
      children: [
        Row(
          children: const [
            Expanded(child: StoreNoDropDown()),
            SizedBox(width: 50),
            Expanded(child: VsrNoDropDown()),
          ],
        ),
        const SizedBox(height: 20),
        const BuildStoreNameWidget(),
        const SizedBox(height: 20),
        const PalletIdDropDown(),
        const SizedBox(height: 50),
        Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(addPalletToVsrControllerProvider);
            String data = '';
            state.when(
              initial: () => data = '',
              loading: (message) => data = message,
              error: (message) => data = message,
              data: (d) =>
                  data = 'Pallet "${d.pallet}" added to VSR "${d.vsr}".',
            );

            return BuildResultWidget(data: data);
          },
        ),
      ],
    );
  }
}
