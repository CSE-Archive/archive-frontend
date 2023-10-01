import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class ResourceController extends GetxController with StateMixin {
  final String uuid;

  ResourceController({required this.uuid});

  ResourceModel? resource;

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.resource(uuid: uuid);

    if (result != null) {
      resource = result;

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }
}
