import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/barcode_scan_response.dart';

part 'remove_box_from_location_service.g.dart';

@riverpod
RemoveBoxFromLocationService removeBoxFromLocationService(
    RemoveBoxFromLocationServiceRef ref) {
  return RemoveBoxFromLocationService();
}

class RemoveBoxFromLocationService {
  Future<BarcodeScanResponse> getBarcodeScanResponse({
    required String barcode,
  }) async {
    return const BarcodeScanResponse(
      location: 'location',
      storeNo: 'storeNo',
      storeName: 'storeName',
    );
  }
}
