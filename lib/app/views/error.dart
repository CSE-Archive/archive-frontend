import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/widgets/error.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final void Function()? retryButtonOnPressed;

  const ErrorView({
    super.key,
    required this.retryButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ArchiveWebPage(
      body: ArchiveError(
        type: ArchiveErrorType.general,
        title: ArchiveStrings.errorTitle,
        description: ArchiveStrings.errorDescription,
        button: OutlinedButton(
          onPressed: retryButtonOnPressed,
          child: const Text(ArchiveStrings.errorButton),
        ),
      ),
    );
  }
}
