import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/close_pallet_response.dart';

part 'close_pallet_service.g.dart';

@riverpod
ClosePalletService closePalletService(ClosePalletServiceRef ref) {
  return ClosePalletService();
}

class ClosePalletService {
  Future<ClosePalletResponse> getClosePalletResponse() async {
    return const ClosePalletResponse(
      pallet: 'pallet',
    );
  }
}
