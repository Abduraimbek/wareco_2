import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/box/update_box_details/views/update_box_details_view.dart';
import 'package:wareco_2/src/features/functionalities/information/box_details/presentation/views/box_details_view.dart';
import 'package:wareco_2/src/features/functionalities/information/location_details/presentation/views/location_details_view.dart';
import 'package:wareco_2/src/features/functionalities/information/order_details/presentation/views/order_details_view.dart';
import 'package:wareco_2/src/features/functionalities/information/store_details/presentation/views/store_details_view.dart';
import 'package:wareco_2/src/features/functionalities/information/vsr_details/presentation/views/vsr_details_view.dart';
import 'package:wareco_2/src/features/home/home.dart';

class FunctionalityPage extends ConsumerWidget {
  const FunctionalityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFunction = ref.watch(selectedFunctionProvider);

    switch (selectedFunction) {

      // box
      case Functions.updateBoxDetails:
        return const UpdateBoxDetailsView();

      // pallet
      case Functions.autoPalletize:
        return Scaffold();
      case Functions.palletBuild:
        return Scaffold();
      case Functions.removeBoxFromPallet:
        return Scaffold();
      case Functions.closePallet:
        return Scaffold();
      case Functions.reOpenPallet:
        return Scaffold();

      // vsr
      case Functions.createVsr:
        return Scaffold();
      case Functions.vsrBuild:
        return Scaffold();
      case Functions.removeBoxFromVsr:
        return Scaffold();
      case Functions.removePalletFromVsr:
        return Scaffold();
      case Functions.closeAndPrintVsr:
        return Scaffold();
      case Functions.vsrProofOfDelivery:
        return Scaffold();

      // location
      case Functions.addPalletToLoc:
        return Scaffold();
      case Functions.removeBoxFromLoc:
        return Scaffold();
      case Functions.removePalletFromLoc:
        return Scaffold();

      // inventory
      case Functions.stockTake:
        return Scaffold();

      // maintenance
      case Functions.assignStoreToLocation:
        return Scaffold();
      case Functions.createPalletId:
        return Scaffold();
      case Functions.registerCarrierVanNo:
        return Scaffold();
      case Functions.rePrintPalletId:
        return Scaffold();
      case Functions.rePrintVsr:
        return Scaffold();
      case Functions.reOpenVsr:
        return Scaffold();

      // information
      case Functions.orderDetails:
        return const OrderDetailsView();
      case Functions.storeDetails:
        return const StoreDetailsView();
      case Functions.locationDetails:
        return const LocationDetailsView();
      case Functions.boxDetails:
        return const BoxDetailsView();
      case Functions.palletDetails:
        return Scaffold();
      case Functions.vsrDetails:
        return const VsrDetailsView();
    }
  }
}
