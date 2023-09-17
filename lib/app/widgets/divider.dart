import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:flutter/material.dart';

class ArchiveDivider extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry? margin;

  const ArchiveDivider({
    super.key,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      margin: margin ?? EdgeInsets.zero,
      width: double.infinity,
      color: (color ?? context.primaryColor).withOpacity(0.15),
    );
  }
}
