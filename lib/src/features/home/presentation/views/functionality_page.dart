import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/box/add_box_to_location/presentation/views/add_box_to_location_view.dart';
import 'package:wareco_2/src/features/functionalities/box/add_box_to_pallet/presentation/views/add_box_to_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/box/add_box_to_vsr/presentation/views/add_box_to_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/box/box_information/presentation/views/box_information_view.dart';
import 'package:wareco_2/src/features/functionalities/box/remove_box_from_location/presentation/views/remove_box_from_location_view.dart';
import 'package:wareco_2/src/features/functionalities/box/remove_box_from_pallet/presentation/views/remove_box_from_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/box/remove_box_from_vsr/presentation/views/remove_box_from_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/box/stock_take/presentation/views/stock_take_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/add_pallet_to_location/presentation/views/add_pallet_to_location_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/add_pallet_to_vsr/presentation/views/add_pallet_to_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/auto_palletize/presentation/views/auto_palletize_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/close_pallet/presentation/views/close_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/create_pallet_id/presentation/views/create_pallet_id_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/pallet_information/presentation/views/pallet_information_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/remove_pallet_from_location/presentation/views/remove_pallet_from_location_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/remove_pallet_from_vsr/presentation/views/remove_pallet_from_svr_view.dart';
import 'package:wareco_2/src/features/functionalities/pallet/reopen_pallet/presentation/views/reopen_pallet_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/assign_carrier/presentation/views/assign_carrier_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/assign_security_seals/presentation/views/assign_security_seals_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/close_and_print_vsr/presentation/views/close_and_print_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/craete_vsr/presentation/views/create_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/reopen_vsr/presentation/views/reopen_vsr_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/vsr_information/presentation/views/vsr_information_view.dart';
import 'package:wareco_2/src/features/functionalities/vsr/vsr_proof_of_delivery/presentation/views/vsr_proof_of_delivery_view.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

class FunctionalityPage extends ConsumerWidget {
  const FunctionalityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFunction = ref.watch(selectedFunctionProvider);

    if (selectedFunction == null) {
      return Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, _) {
              return MyMaxWidthButton(
                onPressed: () => Navigator.of(context).pop(),
                text: ref.watch(languageProvider).back,
              );
            },
          ),
        ),
      );
    } else {
      switch (selectedFunction.functionEnum) {
        // box
        case FunctionEnum.addBoxToPallet:
          return const AddBoxToPalletView();
        case FunctionEnum.addBoxToVsr:
          return const AddBoxToVsrView();
        case FunctionEnum.addBoxToLocation:
          return const AddBoxToLocationView();
        case FunctionEnum.removeBoxFromPallet:
          return const RemoveBoxFromPalletView();
        case FunctionEnum.removeBoxFromVsr:
          return const RemoveBoxFromVsrView();
        case FunctionEnum.removeBoxFromLocation:
          return const RemoveBoxFromLocationView();
        case FunctionEnum.stockTake:
          return const StockTakeView();
        case FunctionEnum.boxInformation:
          return const BoxInformation();

        // pallet
        case FunctionEnum.createPalletId:
          return const CreatePalletIdView();
        case FunctionEnum.autoPalletize:
          return const AutoPalletizeView();
        case FunctionEnum.addPalletToVsr:
          return const AddPalletToVsrView();
        case FunctionEnum.addPalletToLocation:
          return const AddPalletToLocationView();
        case FunctionEnum.closePallet:
          return const ClosePalletView();
        case FunctionEnum.reopenPallet:
          return const ReopenPalletView();
        case FunctionEnum.removePalletFromVsr:
          return const RemovePalletFromVsrView();
        case FunctionEnum.removePalletFromLocation:
          return const RemovePalletFromLocationView();
        case FunctionEnum.palletInformation:
          return const PalletInformationView();

        // vsr
        case FunctionEnum.createVsr:
          return const CreateVsrView();
        case FunctionEnum.assignCarrier:
          return const AssignCarrierView();
        case FunctionEnum.assignSecuritySeals:
          return const AssignSecuritySealsView();
        case FunctionEnum.closeAndPrintVsr:
          return const CloseAndPrintVsrView();
        case FunctionEnum.reopenVsr:
          return const ReopenVsrView();
        case FunctionEnum.vsrProofOfDelivery:
          return const VsrProofOfDeliveryView();
        case FunctionEnum.vsrInformation:
          return const VsrInformationView();
      }
    }
  }
}
