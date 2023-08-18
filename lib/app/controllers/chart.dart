import 'package:cse_archive/app/models/chart_node.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:get/get.dart';

class ChartController extends GetxController with StateMixin {
  static const semestersNO = 8;

  late List<List<ChartNodeModel>> listOfChartNodes;
  late Map<CourseType, List<CourseModel>> extra;

  @override
  void onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    change(null, status: RxStatus.loading());

    // TODO: Load data

    final result = <ChartNodeModel>[];
    listOfChartNodes = [];

    for (int semester = 1; semester <= semestersNO; semester++) {
      listOfChartNodes.add(
        result.where((chartNode) => chartNode.semester == semester).toList()
          ..sort((a, b) => a.order.compareTo(b.order)),
      );
    }

    change(null, status: RxStatus.success());
  }
}
