import 'package:freezed_annotation/freezed_annotation.dart';

part 'barcode_scan_response.freezed.dart';

@freezed
class BarcodeScanResponse with _$BarcodeScanResponse {
  const factory BarcodeScanResponse({
    required String palletId,
    required String storeNo,
    required String storeName,
  }) = _BarcodeScanResponse;
}
