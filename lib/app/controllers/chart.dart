import 'package:cse_archive/app/models/chart_node.dart';
import 'package:cse_archive/app/services/api.dart';
import 'package:get/get.dart';

class ChartController extends GetxController with StateMixin {
  static const _semestersNO = 8;

  late List<List<ChartNodeModel>> listOfChartNodes = [];

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    final result = await APIService.to.chart();

    if (result != null) {
      for (int semester = 1; semester <= _semestersNO; semester++) {
        listOfChartNodes.add(
          result.where((chartNode) => chartNode.semester == semester).toList()
            ..sort((a, b) => a.column.compareTo(b.column)),
        );
      }

      change(null, status: RxStatus.success());
    } else {
      // TODO: Show error view
      change(null, status: RxStatus.error());
    }
  }
}
