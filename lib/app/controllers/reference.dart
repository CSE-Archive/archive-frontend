import 'package:cse_archive/app/models/reference.dart';
import 'package:get/get.dart';

class ReferenceController extends GetxController with StateMixin {
  final int referenceId;

  ReferenceController({required this.referenceId});

  late ReferenceModel reference;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data

    change(null, status: RxStatus.success());
  }
}
