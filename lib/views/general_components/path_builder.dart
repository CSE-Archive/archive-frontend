import 'package:cse_archive/constants.dart';
import 'package:cse_archive/views/general_components/custom_text_button.dart';
import 'package:flutter/material.dart';

Widget pathBuilder(
  BuildContext context, {
  required Map<String, void Function()?> roots,
}) {
  List<Widget> children = [];

  var renderedRoots = roots.entries
      .map(
        (entry) => CustomTextButton(
          label: entry.key,
          onPressed: entry.value,
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
          showUnderline: false,
        ),
      )
      .toList();

  for (int index = 0; index < renderedRoots.length; index++) {
    children.add(renderedRoots.elementAt(index));
    if (index != renderedRoots.length - 1) {
      children.add(
        Icon(
          Icons.chevron_right,
          color: Theme.of(context).colorScheme.secondary,
          size: kSizeDefault,
        ),
      );
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: children,
  );
}
