import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/reopen_pallet_response.dart';

part 'reopen_pallet_service.g.dart';

@riverpod
ReopenPalletService reopenPalletService(ReopenPalletServiceRef ref) {
  return ReopenPalletService();
}

class ReopenPalletService {
  Future<ReopenPalletResponse> getReopenPalletResponse() async {
    return const ReopenPalletResponse(
      pallet: 'pallet',
    );
  }
}
