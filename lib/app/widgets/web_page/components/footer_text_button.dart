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
          Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.secondary.withOpacity(0.6);
            }
            return Theme.of(context).colorScheme.secondary;
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
