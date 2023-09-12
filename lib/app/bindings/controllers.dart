import 'package:cse_archive/app/controllers/search_text_field.dart';
import 'package:get/get.dart';

Future<void> controllersBinding() async {
  Get.put(
    SearchTextFieldController(),
    tag: 'appbar',
    permanent: true,
  );
}
