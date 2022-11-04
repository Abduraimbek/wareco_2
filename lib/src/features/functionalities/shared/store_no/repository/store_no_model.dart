import 'package:equatable/equatable.dart';

class StoreNoModel extends Equatable {
  final int number;

  const StoreNoModel({required this.number});

  @override
  List<Object?> get props => [number];
}
