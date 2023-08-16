import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';

import 'app/controllers/initializer.dart';
import 'app/routes/config.dart';
import 'app/services/initializer.dart';
import 'app/services/theme_mode.dart';
import 'app/themes.dart';

void main() async {
  await servicesInitializer();

  controllersInitializer();

  usePathUrlStrategy();

  runApp(const CSEArchive());
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
        locale: const Locale('fa', 'IR'),
        supportedLocales: const [Locale('fa', 'IR')],
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
      ),
    );
  }
}
