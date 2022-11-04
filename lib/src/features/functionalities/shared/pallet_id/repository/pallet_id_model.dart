import 'package:equatable/equatable.dart';

class PalletIdModel extends Equatable {
  final int number;

  const PalletIdModel({required this.number});

  @override
  List<Object?> get props => [number];
}
