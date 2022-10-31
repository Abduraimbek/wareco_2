import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wareco_2/src/app.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
List<FunctionModel> functionsByCategory(FunctionsByCategoryRef ref) {
  final functions = ref.watch(functionsProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  return functions
      .where((e) => e.category == selectedCategory?.functionCategoryEnum)
      .toList();
}

@Riverpod(keepAlive: true)
FunctionCategoryModel? selectedCategory(SelectedCategoryRef ref) {
  return ref.watch(homeProvider.select((value) => value.selectedCategory));
}

@Riverpod(keepAlive: true)
FunctionModel? selectedFunction(SelectedFunctionRef ref) {
  return ref.watch(homeProvider.select((value) => value.selectedFunction));
}

@Riverpod(keepAlive: true)
class Home extends _$Home {
  @override
  HomeState build() {
    return HomeState.initial();
  }

  void onCategoryPressed(BuildContext context, FunctionCategoryModel category) {
    state = HomeState(
      selectedCategory: category,
      selectedFunction: state.selectedFunction,
    );
    Navigator.of(context).pushNamed(App.functionsPage);
  }

  void onFunctionPressed(BuildContext context, FunctionModel function) {
    state = HomeState(
      selectedCategory: state.selectedCategory,
      selectedFunction: function,
    );
    Navigator.of(context).pushNamed(App.functionalityPage);
  }
}

class HomeState extends Equatable {
  final FunctionCategoryModel? selectedCategory;
  final FunctionModel? selectedFunction;

  const HomeState({
    required this.selectedCategory,
    required this.selectedFunction,
  });

  @override
  List<Object?> get props => [selectedCategory, selectedFunction];

  factory HomeState.initial() {
    return HomeState(
      selectedCategory: null,
      selectedFunction: _get(),
    );
  }
}

FunctionModel _get() {
  return const FunctionModel(
    functionEnum: FunctionEnum.addPalletToVsr,
    category: FunctionCategoryEnum.vsr,
    titleEn: '',
  );
}
