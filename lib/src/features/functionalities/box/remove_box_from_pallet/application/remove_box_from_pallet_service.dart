import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/barcode_scan_response.dart';

part 'remove_box_from_pallet_service.g.dart';

@riverpod
RemoveBoxFromPalletService removeBoxFromPalletService(
    RemoveBoxFromPalletServiceRef ref) {
  return RemoveBoxFromPalletService();
}

class RemoveBoxFromPalletService {
  Future<BarcodeScanResponse> getBarcodeScanResponse({
    required String barcode,
  }) async {
    return const BarcodeScanResponse(
      palletId: 'palletId',
      storeNo: 'storeNo',
      storeName: 'storeName',
    );
  }
}
