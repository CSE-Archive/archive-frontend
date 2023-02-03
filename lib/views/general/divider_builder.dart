import 'package:flutter/material.dart';

Widget dividerBuilder(BuildContext context) {
  return Container(
    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
    width: double.infinity,
    height: 1,
  );
}
