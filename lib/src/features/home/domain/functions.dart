import 'menus.dart';

enum Functions {
  // box
  updateBoxDetails(Menus.box, 'UPDATE BOX DETAILS'),

  // pallet
  autoPalletize(Menus.pallet, 'AUTO-PALLETIZE'),
  palletBuild(Menus.pallet, 'PALLET BUILD'),
  removeBoxFromPallet(Menus.pallet, 'REMOVE BOX FROM PALLET'),
  closePallet(Menus.pallet, 'CLOSE PALLET'),
  reOpenPallet(Menus.pallet, 'RE-OPEN PALLET'),

  // vsr
  createVsr(Menus.vsr, 'CREATE VSR'),
  vsrBuild(Menus.vsr, 'VSR BUILD'),
  removeBoxFromVsr(Menus.vsr, 'REMOVE BOX FROM VSR'),
  removePalletFromVsr(Menus.vsr, 'REMOVE PALLET FROM VSR'),
  closeAndPrintVsr(Menus.vsr, 'CLOSE AND PRINT VSR'),
  vsrProofOfDelivery(Menus.vsr, 'VSR PROOF OF DELIVERY'),

  // location
  addPalletToLoc(Menus.location, 'ADD PALLET TO LOC.'),
  removeBoxFromLoc(Menus.location, 'REMOVE BOX FROM LOC.'),
  removePalletFromLoc(Menus.location, 'REMOVE PALLET FROM LOC.'),

  // inventory
  stockTake(Menus.inventory, 'STOCK TAKE'),

  // maintenance
  assignStoreToLocation(Menus.maintenance, 'ASSIGN STORE TO LOCATION'),
  createPalletId(Menus.maintenance, 'CREATE PALLET ID'),
  registerCarrierVanNo(Menus.maintenance, 'REGISTER CARRIER VAN NO.'),
  rePrintPalletId(Menus.maintenance, 'RE-PRINT PALLET ID'),
  rePrintVsr(Menus.maintenance, 'RE-PRINT VSR'),
  reOpenVsr(Menus.maintenance, 'RE-OPEN VSR'),

  // information
  orderDetails(Menus.information, 'ORDER DETAILS'),
  storeDetails(Menus.information, 'STORE DETAILS'),
  locationDetails(Menus.information, 'LOCATION DETAILS'),
  boxDetails(Menus.information, 'BOX DETAILS'),
  palletDetails(Menus.information, 'PALLET DETAILS'),
  vsrDetails(Menus.information, 'VSR DETAILS');

  final Menus menu;
  final String text;

  const Functions(this.menu, this.text);
}
