import 'package:cse_archive/bindings/initial_binding.dart';
import 'package:cse_archive/bindings/home_binding.dart';
import 'package:cse_archive/bindings/reference_item_binding.dart';
import 'package:cse_archive/themes.dart';
import 'package:cse_archive/translations.dart';
import 'package:cse_archive/views/home/home_view.dart';
import 'package:cse_archive/views/loading_view.dart';
import 'package:cse_archive/views/reference_item/references_item_view.dart'
    deferred as reference_item_view_deferred;
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
          page: () => const HomeView(),
          binding: HomeBinding(),
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
          binding: ReferenceItemBinding(),
        ),
      ],
    );
  }
}
