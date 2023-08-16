import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/themes.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArchiveWebPage(
      bodyPadding: 0,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height - ArchiveThemes.appbarHeight,
        child: Center(
          child: Text(
            ArchiveStrings.loading,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
