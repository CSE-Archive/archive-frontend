import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/widgets/error.dart';
import 'package:cse_archive/app/widgets/web_page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class NotFoundView extends StatelessWidget {
  final String? route;

  const NotFoundView({
    super.key,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ArchiveWebPage(
      body: ArchiveError(
        type: ArchiveErrorType.notFound,
        title: ArchiveStrings.notFoundTitle,
        description: ArchiveStrings.notFoundDescriptionP1 +
            (route ?? ArchiveStrings.notFoundDescriptionP1_5) +
            ArchiveStrings.notFoundDescriptionP2,
        button: Link(
          uri: Uri(path: ArchiveRoutes.home),
          builder: (_, followLink) => OutlinedButton(
            onPressed: followLink,
            child: const Text(ArchiveStrings.notFoundButton),
          ),
        ),
      ),
    );
  }
}
