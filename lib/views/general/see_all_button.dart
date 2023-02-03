import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        shadowColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        ),
        overlayColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
      child: Text(
        'seeAll'.tr,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
