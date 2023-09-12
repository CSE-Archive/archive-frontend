import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class ProfessorController extends GetxController with StateMixin {
  final String uuid;

  ProfessorController({required this.uuid});

  ProfessorModel? professor;

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.professor(uuid: uuid);

    if (result != null) {
      professor = result;

      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }
}
