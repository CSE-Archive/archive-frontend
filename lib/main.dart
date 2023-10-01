import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/bindings/controllers.dart';
import 'app/bindings/services.dart';
import 'app/routes/config.dart';
import 'app/services/theme_mode.dart';
import 'app/scroll_behavior.dart';
import 'app/themes.dart';

void main() async {
  await dotenv.load();

  await servicesBinding();
  await controllersBinding();

  usePathUrlStrategy();

  if (kDebugMode) {
    runApp(const CSEArchive());
  } else {
    await SentryFlutter.init(
      (options) {
        options.tracesSampleRate = 1.0;
        options.attachStacktrace = true;
        options.dsn = dotenv.env['SENTRY_DSN'];
      },
      appRunner: () => runApp(const CSEArchive()),
    );
  }
}

class CSEArchive extends StatelessWidget {
  const CSEArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp.router(
        title: 'CSE Archive',
        debugShowCheckedModeBanner: false,
        routerConfig: kRouterConfig,
        theme: ArchiveThemes.light,
        darkTheme: ArchiveThemes.dark,
        themeMode: ThemeModeService.to.currentMode.value,
        scrollBehavior: ArchiveScrollBehavior(),
        locale: const Locale('fa', 'IR'),
        supportedLocales: const [Locale('fa', 'IR')],
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
