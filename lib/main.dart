import 'package:cse_archive/bindings/chart_binding.dart';
import 'package:cse_archive/bindings/initial_binding.dart';
import 'package:cse_archive/bindings/home_binding.dart';
import 'package:cse_archive/controllers/appbar_controller.dart';
import 'package:cse_archive/customs.dart';
import 'package:cse_archive/themes.dart';
import 'package:cse_archive/translations.dart';
import 'package:cse_archive/views/home/home_view.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:cse_archive/views/chart/chart_view.dart'
    deferred as chart_view_deferred;
import 'package:cse_archive/views/reference_item/references_item_view.dart'
    deferred as reference_item_view_deferred;
import 'package:cse_archive/views/teacher_item/teacher_item_view.dart'
    deferred as teacher_item_view_deferred;
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() {
  usePathUrlStrategy();
  runApp(const CSEArchive());
}

class CSEArchive extends StatelessWidget {
  const CSEArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      translations: MyTranslations(),
      title: 'CSE Archive',
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('fa', 'IR'),
      initialRoute: '/',
      initialBinding: InitialBinding(),
      defaultTransition: Transition.noTransition,
      getPages: [
        GetPage(
          name: '/',
          page: () {
            Get.find<AppbarController>().activeButton.value =
                AppbarButtons.none;
            return const HomeView();
          },
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/chart',
          page: () => FutureBuilder(
            future: chart_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Get.find<AppbarController>().activeButton.value =
                    AppbarButtons.chart;
                return chart_view_deferred.ChartView();
              }
              return const LoadingView();
            },
          ),
          binding: ChartBinding(),
        ),
        GetPage(
          name: '/references/:id/:slug',
          page: () => FutureBuilder(
            future: reference_item_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return reference_item_view_deferred.ReferenceItemView();
              }
              return const LoadingView();
            },
          ),
        ),
        GetPage(
          name: '/teachers/:id/:slug',
          page: () => FutureBuilder(
            future: teacher_item_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return teacher_item_view_deferred.TeacherItemView();
              }
              return const LoadingView();
            },
          ),
        ),
      ],
    );
  }
}
