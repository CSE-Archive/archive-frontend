import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class ReferenceController extends GetxController with StateMixin {
  final String uuid;

  ReferenceController({required this.uuid});

  ReferenceModel? reference;

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.reference(uuid: uuid);

    if (result != null) {
      reference = result;

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }
}
