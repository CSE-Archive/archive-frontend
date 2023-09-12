import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class RecordingsController extends GetxController with StateMixin {
  int paginationCounter = 1;

  final recordings = <RecordedClassroomModel>[].obs;
  final isThereMore = false.obs;
  final isLoadingMore = false.obs;

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.recordings();

    if (result != null) {
      paginationCounter = 1;

      isThereMore.value = result.isThereMore;
      recordings.value = result.recordings;
      recordings.refresh();

      change(null, status: RxStatus.success());
    } else {
      // TODO: Show error view
      change(null, status: RxStatus.error());
    }
  }

  Future<void> loadMore() async {
    isLoadingMore.value = true;

    final result = await APIService.to.recordings(
      offset: kDataLimit * paginationCounter,
    );

    if (result != null) {
      paginationCounter++;

      isThereMore.value = result.isThereMore;
      recordings.addAll(result.recordings);
      recordings.refresh();
    } else {
      // TODO: Show error view
    }

    isLoadingMore.value = false;
  }
}
