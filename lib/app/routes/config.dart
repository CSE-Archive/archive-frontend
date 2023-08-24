import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/services/pages_tracker.dart';
import 'package:cse_archive/app/views/chart.dart' deferred as chart;
import 'package:cse_archive/app/views/course/course.dart' deferred as course;
import 'package:cse_archive/app/views/courses.dart' deferred as courses;
import 'package:cse_archive/app/views/home.dart' deferred as home;
import 'package:cse_archive/app/views/loading.dart';
import 'package:cse_archive/app/views/recordings.dart' deferred as recordings;
import 'package:cse_archive/app/views/reference.dart' deferred as reference;
import 'package:cse_archive/app/views/references.dart' deferred as references;
import 'package:cse_archive/app/views/resources.dart' deferred as resources;
import 'package:cse_archive/app/views/search.dart' deferred as search;
import 'package:cse_archive/app/views/professor.dart' deferred as professor;
import 'package:cse_archive/app/views/professors.dart' deferred as professors;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> _noTransitionBuilder({
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      opaque: false,
      barrierDismissible: true,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (_, __, ___, child) => child,
      child: child,
    );

Widget _viewLoader({
  required Future<dynamic> future,
  required Widget Function() builder,
}) =>
    FutureBuilder(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) return builder();
        return const LoadingView();
      },
    );

// TODO: Add 404 not found route to onException
// TODO: Add SentryNavigatorObserver to observers
final kRouterConfig = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: ArchiveRoutes.home,
  routes: [
    GoRoute(
      path: ArchiveRoutes.home,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: home.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.home;
            return home.HomeView();
          },
        ),
      ),
    ),
    GoRoute(
      path: ArchiveRoutes.chart,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: chart.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.chart;
            return chart.ChartView();
          },
        ),
      ),
    ),
    GoRoute(
      path: ArchiveRoutes.search,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: search.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.search;

            return search.SearchView();
          },
        ),
      ),
    ),
    GoRoute(
      path: ArchiveRoutes.recordings,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: recordings.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.recordings;
            return recordings.RecordingsView();
          },
        ),
      ),
    ),
    GoRoute(
      path: ArchiveRoutes.resources,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: resources.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.resources;
            return resources.ResourcesView();
          },
        ),
      ),
    ),
    GoRoute(
      path: ArchiveRoutes.references,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: references.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.references;

            return references.ReferencesView(
              parameters: state.pathParameters,
            );
          },
        ),
      ),
      routes: [
        GoRoute(
          path: ':id',
          pageBuilder: (_, state) => _noTransitionBuilder(
            state: state,
            child: _viewLoader(
              future: reference.loadLibrary(),
              builder: () {
                PageTrackerService.to.activePage = ArchivePage.reference;

                return reference.ReferenceView(
                  id: state.pathParameters['id']!,
                );
              },
            ),
          ),
        ),
      ],
    ),
    GoRoute(
      path: ArchiveRoutes.professors,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: professors.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.professors;
            return professors.ProfessorsView(
              parameters: state.pathParameters,
            );
          },
        ),
      ),
      routes: [
        GoRoute(
          path: ':id',
          pageBuilder: (_, state) => _noTransitionBuilder(
            state: state,
            child: _viewLoader(
              future: professor.loadLibrary(),
              builder: () {
                PageTrackerService.to.activePage = ArchivePage.professor;

                return professor.ProfessorView(
                  id: state.pathParameters['id']!,
                );
              },
            ),
          ),
        ),
      ],
    ),
    GoRoute(
      path: ArchiveRoutes.courses,
      pageBuilder: (_, state) => _noTransitionBuilder(
        state: state,
        child: _viewLoader(
          future: courses.loadLibrary(),
          builder: () {
            PageTrackerService.to.activePage = ArchivePage.courses;

            return courses.CoursesView(
              parameters: state.pathParameters,
            );
          },
        ),
      ),
      routes: [
        GoRoute(
          path: ':id',
          pageBuilder: (_, state) => _noTransitionBuilder(
            state: state,
            child: _viewLoader(
              future: course.loadLibrary(),
              builder: () {
                PageTrackerService.to.activePage = ArchivePage.course;

                return course.CourseView(
                  id: state.pathParameters['id']!,
                );
              },
            ),
          ),
        ),
      ],
    ),
  ],
);
