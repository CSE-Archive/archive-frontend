import 'package:cse_archive/app/constants.dart';
import 'package:flutter/material.dart';

import 'appbar_builder.dart';

Widget basicWebPage({
  Widget? appbar,
  Widget? footer,
  required BuildContext context,
  required Widget body,
}) {
  return Scaffold(
    body: Center(
      child: SizedBox(
        width: kSizeMaxWidth,
        child: ListView(
          primary: true,
          children: [
            appbar ?? appbarBuilder(context),
            const SizedBox(height: kSizeDefault),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2 * kSizeDefault),
              child: body,
            ),
            const SizedBox(height: 2 * kSizeDefault),
          ],
        ),
      ),
    ),
  );
}
