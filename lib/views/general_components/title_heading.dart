import 'package:cse_archive/constants.dart';
import 'package:flutter/material.dart';

import 'see_all_button.dart';

class TitleHeading extends StatelessWidget {
  const TitleHeading({
    Key? key,
    required this.title,
    this.seeAllOnPressed,
  }) : super(key: key);

  final String title;
  final void Function()? seeAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2 * kSizeDefault,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              margin: EdgeInsets.only(
                right: kSizeDefault,
                left: (seeAllOnPressed != null) ? kSizeDefault : 0,
              ),
            ),
          ),
          if (seeAllOnPressed != null) SeeAllButton(onPressed: seeAllOnPressed),
        ],
      ),
    );
  }
}
