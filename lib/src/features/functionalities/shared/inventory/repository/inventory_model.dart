import 'package:equatable/equatable.dart';

class InventoryModel extends Equatable {
  final int number;

  const InventoryModel({required this.number});

  @override
  List<Object?> get props => [number];
}
