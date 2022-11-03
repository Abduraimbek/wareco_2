import 'menus.dart';

enum Functions {
  // boxFunctions
  addBoxToPallet(
    menu: Menus.boxFunctions,
    text: 'ADD BOX TO PALLET',
  ),
  addBoxToVsr(
    menu: Menus.boxFunctions,
    text: 'ADD BOX TO VSR',
  ),
  addBoxToLocation(
    menu: Menus.boxFunctions,
    text: 'ADD BOX TO LOCATION',
  ),
  removeBoxFromPallet(
    menu: Menus.boxFunctions,
    text: 'REMOVE BOX FROM PALLET',
  ),
  removeBoxFromVsr(
    menu: Menus.boxFunctions,
    text: 'REMOVE BOX FROM VSR',
  ),
  removeBoxFromLocation(
    menu: Menus.boxFunctions,
    text: 'REMOVE BOX FROM LOCATION',
  ),
  stockTake(
    menu: Menus.boxFunctions,
    text: 'STOCK TAKE',
  ),

  // palletFunctions
  createPalletId(
    menu: Menus.palletFunctions,
    text: 'CREATE PALLET ID',
  ),
  autoPalletize(
    menu: Menus.palletFunctions,
    text: 'AUTO-PALLETIZE',
  ),
  addPalletToVsr(
    menu: Menus.palletFunctions,
    text: 'ADD PALLET TO VSR',
  ),
  addPalletToLocation(
    menu: Menus.palletFunctions,
    text: 'ADD PALLET TO LOCATION',
  ),
  closePallet(
    menu: Menus.palletFunctions,
    text: 'CLOSE PALLET',
  ),
  reopenPallet(
    menu: Menus.palletFunctions,
    text: 'RE-OPEN PALLET',
  ),
  removePalletFromVsr(
    menu: Menus.palletFunctions,
    text: 'REMOVE PALLET FROM VSR',
  ),
  removePalletFromLocation(
    menu: Menus.palletFunctions,
    text: 'REMOVE PALLET FROM LOCATION',
  ),

  // vsrFunctions
  createVsr(
    menu: Menus.vsrFunctions,
    text: 'CREATE VSR',
  ),
  assignCarrier(
    menu: Menus.vsrFunctions,
    text: 'ASSIGN CARRIER',
  ),
  assignSecuritySeals(
    menu: Menus.vsrFunctions,
    text: 'ASSIGN SECURITY SEALS',
  ),
  closeAndPrintVsr(
    menu: Menus.vsrFunctions,
    text: 'CLOSE AND PRINT VSR',
  ),
  vsrProofOfDelivery(
    menu: Menus.vsrFunctions,
    text: 'VSR PROOF OF DELIVERY',
  ),

  // maintenance
  assignStoreToLocation(
    menu: Menus.maintenance,
    text: 'ASSIGN STORE TO LOCATION',
  ),
  createPalletIdMaintenance(
    menu: Menus.maintenance,
    text: 'CREATE PALLET ID MAINTENANCE',
  ),
  registerCarrierVanNo(
    menu: Menus.maintenance,
    text: 'REGISTER CARRIER VAN NO.',
  ),
  reprintPalletId(
    menu: Menus.maintenance,
    text: 'RE-PRINT PALLET ID',
  ),
  reprintVsr(
    menu: Menus.maintenance,
    text: 'RE-PRINT VSR',
  ),
  reopenVsr(
    menu: Menus.maintenance,
    text: 'RE-OPEN VSR',
  ),

  // information
  boxDetails(
    menu: Menus.information,
    text: 'BOX DETAILS',
  ),
  palletDetails(
    menu: Menus.information,
    text: 'PALLET DETAILS',
  ),
  vsrDetails(
    menu: Menus.information,
    text: 'VSR DETAILS',
  ),
  orderDetails(
    menu: Menus.information,
    text: 'ORDER DETAILS',
  ),
  storeDetails(
    menu: Menus.information,
    text: 'STORE DETAILS',
  ),
  locationDetails(
    menu: Menus.information,
    text: 'LOCATION DETAILS',
  );

  final Menus menu;
  final String text;

  const Functions({
    required this.menu,
    required this.text,
  });
}
