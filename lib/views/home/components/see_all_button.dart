import 'package:cse_archive/constants.dart';
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
          Colors.white,
        ),
        shadowColor: MaterialStateProperty.all(
          kColorPrimary.withOpacity(0.5),
        ),
        overlayColor: MaterialStateProperty.all(
          Colors.white,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: kColorPrimary),
          ),
        ),
      ),
      child: Text(
        'seeAll'.tr,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: kColorPrimary),
      ),
    );
  }
}
