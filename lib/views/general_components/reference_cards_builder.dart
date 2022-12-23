import 'package:cse_archive/constants.dart';
import 'package:cse_archive/models/reference_model.dart';
import 'package:cse_archive/views/general_components/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

Widget referenceCardsBuilder(List<ReferenceModel> references) {
  return SizedBox(
    height: 22 * kSizeDefault,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: references.length,
      itemBuilder: (context, index) {
        var reference = references[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == 0) const SizedBox(width: kSizeDefault),
            Container(
              width: 19 * kSizeDefault,
              margin: const EdgeInsets.only(
                left: kSizeDefault,
                top: kSizeDefault,
                bottom: kSizeDefault,
              ),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
                                      reference.authors.join(', '))
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (index == references.length - 1)
              const SizedBox(width: kSizeDefault),
          ],
        );
      },
    ),
  );
}
