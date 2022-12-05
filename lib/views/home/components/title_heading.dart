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
                  color: kColorPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: Divider(
              color: kColorPrimary.withOpacity(0.5),
              indent: kSizeDefault,
              endIndent: kSizeDefault,
            ),
          ),
          SeeAllButton(onPressed: seeAllOnPressed),
        ],
      ),
    );
  }
}
