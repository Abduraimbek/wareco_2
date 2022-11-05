import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'vsr_no_service.g.dart';

@riverpod
VsrNoService vsrNoService(VsrNoServiceRef ref) {
  return VsrNoService();
}

class VsrNoService {
  Future<List<VsrNoModel>> getVsrNos() async {
    return const [
      VsrNoModel(number: 1),
      VsrNoModel(number: 2),
      VsrNoModel(number: 3),
      VsrNoModel(number: 4),
      VsrNoModel(number: 5),
    ];
  }
}
