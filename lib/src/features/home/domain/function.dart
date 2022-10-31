import 'package:equatable/equatable.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'function.g.dart';

enum FunctionEnum {
  // box
  addBoxToPallet,
  addBoxToVsr,
  addBoxToLocation,
  removeBoxFromPallet,
  removeBoxFromVsr,
  removeBoxFromLocation,
  stockTake,
  boxInformation,

  // pallet
  createPalletId,
  autoPalletize,
  addPalletToVsr,
  addPalletToLocation,
  closePallet,
  reopenPallet,
  removePalletFromVsr,
  removePalletFromLocation,
  palletInformation,

  // vsr
  createVsr,
  assignCarrier,
  assignSecuritySeals,
  closeAndPrintVsr,
  reopenVsr,
  vsrProofOfDelivery,
  vsrInformation,
}

class FunctionModel extends Equatable {
  final FunctionEnum functionEnum;
  final FunctionCategoryEnum category;
  final String titleEn;

  const FunctionModel({
    required this.functionEnum,
    required this.category,
    required this.titleEn,
  });

  @override
  List<Object?> get props => [functionEnum, category, titleEn];
}

@Riverpod(keepAlive: true)
List<FunctionModel> functions(FunctionsRef ref) {
  return const [
    // box
    FunctionModel(
      functionEnum: FunctionEnum.addBoxToPallet,
      category: FunctionCategoryEnum.box,
      titleEn: 'Add Box to Pallet',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.addBoxToVsr,
      category: FunctionCategoryEnum.box,
      titleEn: 'Add Box to VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.addBoxToLocation,
      category: FunctionCategoryEnum.box,
      titleEn: 'Add Box to Location',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.removeBoxFromPallet,
      category: FunctionCategoryEnum.box,
      titleEn: 'Remove Box from Pallet',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.removeBoxFromVsr,
      category: FunctionCategoryEnum.box,
      titleEn: 'Remove Box from VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.removeBoxFromLocation,
      category: FunctionCategoryEnum.box,
      titleEn: 'Remove Box from Location',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.stockTake,
      category: FunctionCategoryEnum.box,
      titleEn: 'Stock Take',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.boxInformation,
      category: FunctionCategoryEnum.box,
      titleEn: 'Box Information',
    ),

    // pallet
    FunctionModel(
      functionEnum: FunctionEnum.createPalletId,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Create Pallet ID',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.autoPalletize,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Auto-palletize',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.addPalletToVsr,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Add Pallet to VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.addPalletToLocation,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Add Pallet to Location',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.closePallet,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Close Pallet',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.reopenPallet,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Reopen Pallet',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.removePalletFromVsr,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Remove Pallet from VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.removePalletFromLocation,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Remove Pallet from Location',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.palletInformation,
      category: FunctionCategoryEnum.pallet,
      titleEn: 'Pallet Information',
    ),

    // vsr
    FunctionModel(
      functionEnum: FunctionEnum.createVsr,
      category: FunctionCategoryEnum.vsr,
      titleEn: 'Create VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.assignCarrier,
      category: FunctionCategoryEnum.vsr,
      titleEn: 'Assign VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.assignSecuritySeals,
      category: FunctionCategoryEnum.vsr,
      titleEn: 'Assign Security Seals',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.closeAndPrintVsr,
      category: FunctionCategoryEnum.vsr,
      titleEn: 'Close and Print VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.reopenVsr,
      category: FunctionCategoryEnum.vsr,
      titleEn: 'Reopen VSR',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.vsrProofOfDelivery,
      category: FunctionCategoryEnum.vsr,
      titleEn: 'VSR Proof of Delivery',
    ),
    FunctionModel(
      functionEnum: FunctionEnum.vsrInformation,
      category: FunctionCategoryEnum.vsr,
      titleEn: 'VSR Information',
    ),
  ];
}
