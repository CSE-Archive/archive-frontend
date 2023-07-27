import 'package:cse_archive/app/constants.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import 'custom_card.dart';

Widget referenceCardsBuilder({
  required BuildContext context,
  required List<ReferenceModel> references,
  bool wrap = false,
}) {
  if (wrap) {
    return Wrap(
      children: references
          .map(
            (reference) => singleReferenceCardBuilder(
              context: context,
              reference: reference,
            ),
          )
          .toList(),
    );
  }
  return SizedBox(
    height: kSizeReferenceCardHeight,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: references.length,
      itemBuilder: (context, index) => singleReferenceCardBuilder(
        context: context,
        reference: references[index],
      ),
    ),
  );
}

Container singleReferenceCardBuilder({
  required BuildContext context,
  required ReferenceModel reference,
}) {
  return Container(
    width: kSizeCardWidth,
    height: kSizeReferenceCardHeight,
    margin: const EdgeInsets.all(kSizeDefault / 2),
    child: CustomCard(
      onPressed: () => Get.toNamed(
        '/references/${reference.id}/${reference.slug}',
      ),
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.all(kSizeDefault),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    reference.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: intl.Bidi.detectRtlDirectionality(
                      reference.title,
                    )
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: kSizeDefault / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    reference.authors.join(', '),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: intl.Bidi.detectRtlDirectionality(
                            reference.authors.join(' - '))
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.7),
                        ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 13 * kSizeDefault,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    reference.image,
                  ),
                  fit: BoxFit.cover,
                ),
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
