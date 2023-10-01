import 'package:cse_archive/app/controllers/chart.dart';
import 'package:cse_archive/app/controllers/course.dart';
import 'package:cse_archive/app/controllers/courses.dart';
import 'package:cse_archive/app/controllers/home.dart';
import 'package:cse_archive/app/controllers/professor.dart';
import 'package:cse_archive/app/controllers/professors.dart';
import 'package:cse_archive/app/controllers/recordings.dart';
import 'package:cse_archive/app/controllers/reference.dart';
import 'package:cse_archive/app/controllers/references.dart';
import 'package:cse_archive/app/controllers/resource.dart';
import 'package:cse_archive/app/controllers/resources.dart';
import 'package:cse_archive/app/controllers/search.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/services/pages_tracker.dart';
import 'package:cse_archive/app/views/chart.dart' deferred as chart;
import 'package:cse_archive/app/views/course/course.dart' deferred as course;
import 'package:cse_archive/app/views/courses.dart' deferred as courses;
import 'package:cse_archive/app/views/home.dart' deferred as home;
import 'package:cse_archive/app/views/loading.dart';
import 'package:cse_archive/app/views/not_found.dart' deferred as not_found;
import 'package:cse_archive/app/views/recordings.dart' deferred as recordings;
import 'package:cse_archive/app/views/reference.dart' deferred as reference;
import 'package:cse_archive/app/views/references.dart' deferred as references;
import 'package:cse_archive/app/views/resource.dart' deferred as resource;
import 'package:cse_archive/app/views/resources.dart' deferred as resources;
import 'package:cse_archive/app/views/search.dart' deferred as search;
import 'package:cse_archive/app/views/professor.dart' deferred as professor;
import 'package:cse_archive/app/views/professors.dart' deferred as professors;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

CustomTransitionPage<void> _noTransitionBuilder({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    opaque: false,
    barrierDismissible: true,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    transitionsBuilder: (_, __, ___, child) => child,
    child: child,
  );
}

Widget _viewLoader({
  required Future<dynamic> future,
  required Widget Function() builder,
}) {
  return FutureBuilder(
    future: future,
    builder: (_, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) return builder();
      return const LoadingView();
    },
  );
}

final kRouterConfig = GoRouter(
  debugLogDiagnostics: true,
  observers: [SentryNavigatorObserver()],
  initialLocation: ArchiveRoutes.home,
  onException: (_, state, router) => router.go(
    ArchiveRoutes.notFound,
    extra: state.uri.path,
  ),
  routes: [
    GoRoute(
      path: ArchiveRoutes.notFound,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.notFound;

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: not_found.loadLibrary(),
            builder: () => not_found.NotFoundView(
              route: state.extra as String?,
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: ArchiveRoutes.home,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.home;

        Get.put(HomeController());

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: home.loadLibrary(),
            builder: () => home.HomeView(),
          ),
        );
      },
    ),
    GoRoute(
      path: ArchiveRoutes.chart,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.chart;

        Get.put(ChartController());

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: chart.loadLibrary(),
            builder: () => chart.ChartView(),
          ),
        );
      },
    ),
    GoRoute(
      path: ArchiveRoutes.search,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.search;

        final controller = Get.put(SearchViewController());

        final queryParameters =
            Map<String, String>.from(state.uri.queryParameters);

        controller.setQueryParameters(queryParameters);

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: search.loadLibrary(),
            builder: () => search.SearchView(),
          ),
        );
      },
    ),
    GoRoute(
      path: ArchiveRoutes.recordings,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.recordings;

        final controller = Get.put(RecordingsController());

        controller.fetchData();

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: recordings.loadLibrary(),
            builder: () => recordings.RecordingsView(),
          ),
        );
      },
    ),
    GoRoute(
      path: ArchiveRoutes.resources,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.resources;

        final controller = Get.put(ResourcesController());

        final queryParameters =
            Map<String, String>.from(state.uri.queryParameters);

        controller.setQueryParameters(queryParameters);

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: resources.loadLibrary(),
            builder: () => resources.ResourcesView(
              queryParameters: queryParameters,
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: ':uuid',
          pageBuilder: (context, state) {
            PageTrackerService.to.activePage = ArchivePage.resource;

            final uuid = state.pathParameters['uuid']!;

            final controller = Get.put(
              ResourceController(uuid: uuid),
              tag: uuid,
            );

            controller.fetchData().then(
              (_) {
                if (controller.resource == null) {
                  context.go(ArchiveRoutes.resources);
                }
              },
            );

            return _noTransitionBuilder(
              state: state,
              child: _viewLoader(
                future: resource.loadLibrary(),
                builder: () => resource.ResourceView(
                  uuid: uuid,
                ),
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: ArchiveRoutes.references,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.references;

        final controller = Get.put(ReferencesController());

        final queryParameters =
            Map<String, String>.from(state.uri.queryParameters);

        controller.setQueryParameters(queryParameters);

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: references.loadLibrary(),
            builder: () => references.ReferencesView(
              queryParameters: queryParameters,
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: ':uuid',
          pageBuilder: (context, state) {
            PageTrackerService.to.activePage = ArchivePage.reference;

            final uuid = state.pathParameters['uuid']!;

            final controller = Get.put(
              ReferenceController(uuid: uuid),
              tag: uuid,
            );

            controller.fetchData().then(
              (_) {
                if (controller.reference == null) {
                  context.go(ArchiveRoutes.references);
                }
              },
            );

            return _noTransitionBuilder(
              state: state,
              child: _viewLoader(
                future: reference.loadLibrary(),
                builder: () => reference.ReferenceView(
                  uuid: uuid,
                ),
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: ArchiveRoutes.professors,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.professors;

        final controller = Get.put(ProfessorsController());

        final queryParameters =
            Map<String, String>.from(state.uri.queryParameters);

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: Future.wait([
              professors.loadLibrary(),
              controller.setQueryParameters(queryParameters),
            ]),
            builder: () => professors.ProfessorsView(
              queryParameters: queryParameters,
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: ':uuid',
          pageBuilder: (context, state) {
            PageTrackerService.to.activePage = ArchivePage.professor;

            final uuid = state.pathParameters['uuid']!;

            final controller = Get.put(
              ProfessorController(uuid: uuid),
              tag: uuid,
            );

            controller.fetchData().then(
              (_) {
                if (controller.professor == null) {
                  context.go(ArchiveRoutes.professors);
                }
              },
            );

            return _noTransitionBuilder(
              state: state,
              child: _viewLoader(
                future: professor.loadLibrary(),
                builder: () => professor.ProfessorView(
                  uuid: uuid,
                ),
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: ArchiveRoutes.courses,
      pageBuilder: (_, state) {
        PageTrackerService.to.activePage = ArchivePage.courses;

        final controller = Get.put(CoursesController());

        final queryParameters =
            Map<String, String>.from(state.uri.queryParameters);

        controller.setQueryParameters(queryParameters);

        return _noTransitionBuilder(
          state: state,
          child: _viewLoader(
            future: courses.loadLibrary(),
            builder: () => courses.CoursesView(
              queryParameters: queryParameters,
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: ':uuid',
          pageBuilder: (context, state) {
            PageTrackerService.to.activePage = ArchivePage.course;

            final uuid = state.pathParameters['uuid']!;

            final controller = Get.put(
              CourseController(uuid: uuid),
              tag: uuid,
            );

            controller.fetchData().then(
              (_) {
                if (controller.course == null) {
                  context.go(ArchiveRoutes.courses);
                }
              },
            );

            return _noTransitionBuilder(
              state: state,
              child: _viewLoader(
                future: course.loadLibrary(),
                builder: () => course.CourseView(uuid: uuid),
              ),
            );
          },
        ),
      ],
    ),
  ],
);
