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
    body: SafeArea(
      child: ListView(
        children: [
          appbar ?? appbarBuilder(context),
          const SizedBox(height: 2 * kSizeDefault),
          body,
          const SizedBox(height: 2 * kSizeDefault),
        ],
      ),
    ),
  );
}
