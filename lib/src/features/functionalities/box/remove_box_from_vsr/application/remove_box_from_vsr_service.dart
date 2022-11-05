import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/barcode_scan_response.dart';

part 'remove_box_from_vsr_service.g.dart';

@riverpod
RemoveBoxFromVsrService removeBoxFromVsrService(
    RemoveBoxFromVsrServiceRef ref) {
  return RemoveBoxFromVsrService();
}

class RemoveBoxFromVsrService {
  Future<BarcodeScanResponse> getBarcodeScanResponse({
    required String barcode,
  }) async {
    return const BarcodeScanResponse(
      vsrNo: 'vsrNo',
      storeNo: 'storeNo',
      storeName: 'storeName',
    );
  }
}
