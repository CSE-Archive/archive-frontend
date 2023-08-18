import 'package:cse_archive/app/models/professor.dart';
import 'package:get/get.dart';

class ProfessorController extends GetxController with StateMixin {
  final int professorId;

  ProfessorController({required this.professorId});

  late ProfessorModel professor;

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
