import 'package:flutter/material.dart';
import 'package:wareco_2/src/app.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
List<Functions> functionsByMenu(FunctionsByMenuRef ref) {
  final selectedMenu = ref.watch(selectedMenuProvider);
  return Functions.values.where((e) => e.menu == selectedMenu).toList();
}

@Riverpod(keepAlive: true)
class SelectedFunction extends _$SelectedFunction {
  @override
  Functions build() {
    return Functions.reopenPallet;
  }

  void onFunctionPressed(BuildContext context, Functions function) {
    state = function;
    Navigator.of(context).pushNamed(App.functionalityPage);
  }
}

@Riverpod(keepAlive: true)
class SelectedMenu extends _$SelectedMenu {
  @override
  Menus build() {
    return Menus.boxFunctions;
  }

  void onMenuPressed(BuildContext context, Menus menu) {
    state = menu;
    Navigator.of(context).pushNamed(App.functionsPage);
  }
}
