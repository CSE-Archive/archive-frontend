import 'package:cse_archive/app/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveExpansionTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;

  const ArchiveExpansionTile({
    super.key,
    required this.title,
    this.subtitle,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final expanded = false.obs;

    return ExpansionTile(
      title: title,
      subtitle: subtitle,
      maintainState: true,
      expandedAlignment: Alignment.topRight,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      onExpansionChanged: (value) => expanded(value),
      trailing: Obx(
        () => AnimatedSwitcher(
          duration: 100.milliseconds,
          child: expanded.isTrue
              ? const Icon(
                  ArchiveIcons.chevronUp,
                  key: ValueKey('up'),
                )
              : const Icon(
                  ArchiveIcons.chevronDown,
                  key: ValueKey('down'),
                ),
        ),
      ),
      children: children,
    );
  }
}
