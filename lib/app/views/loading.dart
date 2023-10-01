import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArchiveWebPage(
      applyPlatformVerticalPadding: false,
      onRefresh: () async => GoRouter.of(context).refresh(),
      body: IntrinsicHeight(
        child: Center(
          child: Text(
            ArchiveStrings.loading,
            style: context.headlineSmall.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
