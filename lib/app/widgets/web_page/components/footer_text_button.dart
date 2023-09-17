import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:flutter/material.dart';

class FooterTextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const FooterTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          context.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return context.secondaryColor.withOpacity(0.6);
            }
            return context.secondaryColor;
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
