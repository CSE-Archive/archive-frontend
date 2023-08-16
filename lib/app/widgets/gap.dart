import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double? vertical;
  final double? horizontal;

  const Gap({
    super.key,
    this.vertical,
    this.horizontal,
  });

  const Gap.horizontal(double horizontal, {dynamic key})
      : this(horizontal: horizontal, vertical: 0, key: key);

  const Gap.vertical(double vertical, {dynamic key})
      : this(horizontal: 0, vertical: vertical, key: key);

  static const zero = Gap();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vertical,
      width: horizontal,
    );
  }
}
