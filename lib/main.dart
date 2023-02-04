import 'package:cse_archive/bindings/chart_binding.dart';
import 'package:cse_archive/bindings/courses_binding.dart';
import 'package:cse_archive/bindings/initial_binding.dart';
import 'package:cse_archive/bindings/home_binding.dart';
import 'package:cse_archive/bindings/references_binding.dart';
import 'package:cse_archive/bindings/teachers_binding.dart';
import 'package:cse_archive/controllers/general/appbar_controller.dart';
import 'package:cse_archive/scroll_behavior.dart';
import 'package:cse_archive/themes.dart';
import 'package:cse_archive/translations.dart';
import 'package:cse_archive/views/home/home_view.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:cse_archive/views/chart/chart_view.dart'
    deferred as chart_view_deferred;
import 'package:cse_archive/views/search/search_view.dart'
    deferred as search_view_deferred;
import 'package:cse_archive/views/references/references_view.dart'
    deferred as references_view_deferred;
import 'package:cse_archive/views/teachers/teachers_view.dart'
    deferred as teachers_view_deferred;
import 'package:cse_archive/views/courses/courses_view.dart'
    deferred as courses_view_deferred;
import 'package:cse_archive/views/reference_item/references_item_view.dart'
    deferred as reference_item_view_deferred;
import 'package:cse_archive/views/teacher_item/teacher_item_view.dart'
    deferred as teacher_item_view_deferred;
import 'package:cse_archive/views/course_item/course_item_view.dart'
    deferred as course_item_view_deferred;

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
      scrollBehavior: MyScrollBehavior(),
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
          name: '/search',
          page: () => FutureBuilder(
            future: search_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Get.find<AppbarController>().activeButton.value =
                    AppbarButtons.search;
                return search_view_deferred.SearchView();
              }
              return const LoadingView();
            },
          ),
        ),
        GetPage(
          name: '/references',
          page: () => FutureBuilder(
            future: references_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Get.find<AppbarController>().activeButton.value =
                    AppbarButtons.references;
                return references_view_deferred.ReferencesView();
              }
              return const LoadingView();
            },
          ),
          binding: ReferencesBinding(),
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
          name: '/teachers',
          page: () => FutureBuilder(
            future: teachers_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Get.find<AppbarController>().activeButton.value =
                    AppbarButtons.teachers;
                return teachers_view_deferred.TeachersView();
              }
              return const LoadingView();
            },
          ),
          binding: TeachersBinding(),
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
        GetPage(
          name: '/courses',
          page: () => FutureBuilder(
            future: courses_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Get.find<AppbarController>().activeButton.value =
                    AppbarButtons.courses;
                return courses_view_deferred.CoursesView();
              }
              return const LoadingView();
            },
          ),
          binding: CoursesBinding(),
        ),
        GetPage(
          name: '/courses/:id/:slug',
          page: () => FutureBuilder(
            future: course_item_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return course_item_view_deferred.CourseItemView();
              }
              return const LoadingView();
            },
          ),
        ),
      ],
    );
  }
}
