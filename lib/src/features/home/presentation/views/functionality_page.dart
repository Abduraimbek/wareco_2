import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/box/add_box_to_location/presentation/views/add_box_to_location_view.dart';
import 'package:wareco_2/src/features/functionalities/box/add_box_to_pallet/presentation/views/add_box_to_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/box/add_box_to_vsr/presentation/views/add_box_to_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/box/remove_box_from_location/presentation/views/remove_box_from_location_view.dart';
import 'package:wareco_2/src/features/functionalities/box/remove_box_from_pallet/presentation/views/remove_box_from_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/box/remove_box_from_vsr/presentation/views/remove_box_from_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/box/stock_take/presentation/views/stock_take_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/add_pallet_to_location/presentation/views/add_pallet_to_location_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/add_pallet_to_vsr/presentation/views/add_pallet_to_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/auto_palletize/presentation/views/auto_palletize_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/close_pallet/presentation/views/close_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/create_pallet_id/presentation/views/create_pallet_id_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/remove_pallet_from_location/presentation/views/remove_pallet_from_location_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/remove_pallet_from_vsr/presentation/views/remove_pallet_from_svr_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/reopen_pallet/presentation/views/reopen_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/assign_carrier/presentation/views/assign_carrier_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/assign_security_seals/presentation/views/assign_security_seals_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/close_and_print_vsr/presentation/views/close_and_print_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/craete_vsr/presentation/views/create_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/vsr_proof_of_delivery/presentation/views/vsr_proof_of_delivery_view.dart';
import 'package:wareco_2/src/features/home/home.dart';

class FunctionalityPage extends ConsumerWidget {
  const FunctionalityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFunction = ref.watch(selectedFunctionProvider);

    switch (selectedFunction) {
      // boxFunctions
      case Functions.addBoxToPallet:
        return const AddBoxToPalletView();
      case Functions.addBoxToVsr:
        return const AddBoxToVsrView();
      case Functions.addBoxToLocation:
        return const AddBoxToLocationView();
      case Functions.removeBoxFromPallet:
        return const RemoveBoxFromPalletView();
      case Functions.removeBoxFromVsr:
        return const RemoveBoxFromVsrView();
      case Functions.removeBoxFromLocation:
        return const RemoveBoxFromLocationView();
      case Functions.stockTake:
        return const StockTakeView();

      // palletFunctions
      case Functions.createPalletId:
        return const CreatePalletIdView();
      case Functions.autoPalletize:
        return const AutoPalletizeView();
      case Functions.addPalletToVsr:
        return const AddPalletToVsrView();
      case Functions.addPalletToLocation:
        return const AddPalletToLocationView();
      case Functions.closePallet:
        return const ClosePalletView();
      case Functions.reopenPallet:
        return const ReopenPalletView();
      case Functions.removePalletFromVsr:
        return const RemovePalletFromVsrView();
      case Functions.removePalletFromLocation:
        return const RemovePalletFromLocationView();

      // vsrFunctions
      case Functions.createVsr:
        return const CreateVsrView();
      case Functions.assignCarrier:
        return const AssignCarrierView();
      case Functions.assignSecuritySeals:
        return const AssignSecuritySealsView();
      case Functions.closeAndPrintVsr:
        return const CloseAndPrintVsrView();
      case Functions.vsrProofOfDelivery:
        return const VsrProofOfDeliveryView();

      // maintenance
      case Functions.assignStoreToLocation:
        return Scaffold();
      case Functions.createPalletIdMaintenance:
        return Scaffold();
      case Functions.registerCarrierVanNo:
        return Scaffold();
      case Functions.reprintPalletId:
        return Scaffold();
      case Functions.reprintVsr:
        return Scaffold();
      case Functions.reopenVsr:
        return Scaffold();

      // information
      case Functions.boxDetails:
        return Scaffold();
      case Functions.palletDetails:
        return Scaffold();
      case Functions.vsrDetails:
        return Scaffold();
      case Functions.orderDetails:
        return Scaffold();
      case Functions.storeDetails:
        return Scaffold();
      case Functions.locationDetails:
        return Scaffold();
    }
  }
}
