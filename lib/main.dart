import 'package:cse_archive/app/bindings/services.dart';
import 'package:flutter/gestures.dart';

import 'app/bindings/chart_binding.dart';
import 'app/bindings/courses_binding.dart';
import 'app/bindings/home_binding.dart';
import 'app/bindings/references_binding.dart';
import 'app/bindings/resources_binding.dart';
import 'app/bindings/teachers_binding.dart';
import 'app/services/pages_tracker.dart';
import 'app/themes.dart';
import 'app/translations.dart';
import 'app/views/home.dart';
import 'app/views/loading.dart';
import 'app/views/chart.dart' deferred as chart_view_deferred;
import 'app/views/search.dart' deferred as search_view_deferred;
import 'app/views/resources.dart' deferred as resources_view_deferred;
import 'app/views/references_.dart' deferred as references_view_deferred;
import 'app/views/teachers.dart' deferred as teachers_view_deferred;
import 'app/views/courses.dart' deferred as courses_view_deferred;
import 'app/views/reference.dart' deferred as reference_item_view_deferred;
import 'app/views/teacher.dart' deferred as teacher_item_view_deferred;
import 'app/views/course.dart' deferred as course_item_view_deferred;

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await ArchiveServicesBinding().dependencies();

  usePathUrlStrategy();

  runApp(const CSEArchive());
}

class CSEArchive extends StatelessWidget {
  const CSEArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      title: 'CSE Archive',
      theme: ArchiveThemes.lightTheme,
      darkTheme: ArchiveThemes.darkTheme,
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('fa', 'IR'),
      initialRoute: '/',
      defaultTransition: Transition.noTransition,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () {
            PageTrackerService.to.activePage = ArchivePages.home;
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
                PageTrackerService.to.activePage = ArchivePages.chart;
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
                PageTrackerService.to.activePage = ArchivePages.search;
                return search_view_deferred.SearchView();
              }
              return const LoadingView();
            },
          ),
        ),
        GetPage(
          name: '/resources',
          page: () => FutureBuilder(
            future: resources_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                PageTrackerService.to.activePage = ArchivePages.chart;
                return resources_view_deferred.ResourcesView();
              }
              return const LoadingView();
            },
          ),
          binding: ResourcesBinding(),
        ),
        GetPage(
          name: '/references',
          page: () => FutureBuilder(
            future: references_view_deferred.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                PageTrackerService.to.activePage = ArchivePages.references;
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
                return reference_item_view_deferred.ReferenceView();
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
                PageTrackerService.to.activePage = ArchivePages.teachers;
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
                return teacher_item_view_deferred.TeacherView();
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
                PageTrackerService.to.activePage = ArchivePages.courses;
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
                return course_item_view_deferred.CourseView();
              }
              return const LoadingView();
            },
          ),
        ),
      ],
    );
  }
}
