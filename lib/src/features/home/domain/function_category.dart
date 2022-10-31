import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'function_category.g.dart';

enum FunctionCategoryEnum { box, pallet, vsr }

class FunctionCategoryModel extends Equatable {
  final FunctionCategoryEnum functionCategoryEnum;
  final String titleEN;

  const FunctionCategoryModel({
    required this.functionCategoryEnum,
    required this.titleEN,
  });

  @override
  List<Object?> get props => [functionCategoryEnum, titleEN];
}

@Riverpod(keepAlive: true)
List<FunctionCategoryModel> functionCategories(FunctionCategoriesRef ref) {
  return const [
    FunctionCategoryModel(
      functionCategoryEnum: FunctionCategoryEnum.box,
      titleEN: 'Box Information',
    ),
    FunctionCategoryModel(
      functionCategoryEnum: FunctionCategoryEnum.pallet,
      titleEN: 'Pallet Information',
    ),
    FunctionCategoryModel(
      functionCategoryEnum: FunctionCategoryEnum.vsr,
      titleEN: 'VSR Information',
    ),
  ];
}
