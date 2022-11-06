import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/auto_palletize_controller.dart';

class AutoPalletizeView extends ConsumerWidget {
  const AutoPalletizeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoPalletizeControllerProvider);
    String data = '';
    state.when(
      initial: () => data = '',
      loading: (message) => data = message,
      error: (message) => data = message,
      data: (d) => data =
          'Assigned Pallet "${d.pallet}" to  Location "${d.location}" for Auto-palletizing.',
    );

    return FunctionalityPageScaffold(
      okPressed: () async {
        if (locationKey.currentState!.validate() &&
            storeNoKey.currentState!.validate() &&
            palletIdKey.currentState!.validate()) {
          await ref.read(autoPalletizeControllerProvider.notifier).okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(autoPalletizeControllerProvider);
      },
      children: [
        Row(
          children: const [
            Expanded(child: LocationDropDown()),
            SizedBox(width: 50),
            Expanded(child: StoreNoDropDown()),
          ],
        ),
        const SizedBox(height: 20),
        const BuildStoreNameWidget(),
        const SizedBox(height: 20),
        const PalletIdDropDown(),
        const SizedBox(height: 60),
        BuildResultWidget(data: data),
      ],
    );
  }
}
