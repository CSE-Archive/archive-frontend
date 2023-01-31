import 'package:cse_archive/constants.dart';
import 'package:cse_archive/views/general_components/appbar_builder.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(height: 2 * kSizeDefault),
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
