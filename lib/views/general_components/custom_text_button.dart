import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.labelStyle,
  }) : super(key: key);

  final String label;
  final TextStyle? labelStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        surfaceTintColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        overlayColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
      ),
      child: Text(
        label,
        style: labelStyle ??
            Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
      ),
    );
  }
}
