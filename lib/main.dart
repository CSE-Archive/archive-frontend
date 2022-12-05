import 'package:cse_archive/bindings/initial_binding.dart';
import 'package:cse_archive/bindings/home_binding.dart';
import 'package:cse_archive/themes.dart';
import 'package:cse_archive/translations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:cse_archive/views/home/home_view.dart';
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
      translations: MyTranslations(),
      title: 'CSE Archive',
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('fa', 'IR'),
      color: Colors.white,
      initialRoute: '/',
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
