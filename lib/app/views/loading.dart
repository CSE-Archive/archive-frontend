import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArchiveWebPage(
      applyPlatformVerticalPadding: false,
      body: IntrinsicHeight(
        child: Center(
          child: Text(
            ArchiveStrings.loading,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
      ),
    );
  }
}
