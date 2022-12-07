import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/home/card_hover_controller.dart';
import 'package:cse_archive/controllers/home/reference_cards_controller.dart';
import 'package:cse_archive/controllers/home/resource_cards_controller.dart';
import 'package:cse_archive/views/general_components/appbar_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import 'components/custom_card.dart';
import 'components/title_heading.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var resourceCardsController = Get.find<ResourceCardsController>();
    var referenceCardsController = Get.find<ReferenceCardsController>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: ListView(
            children: [
              appbarBuilder(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 2 * kSizeDefault),
                  TitleHeading(
                    title: 'newResources'.tr,
                    seeAllOnPressed: (() {}),
                  ),
                  SizedBox(
                    height: 9 * kSizeDefault,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: resourceCardsController.resources.length,
                      itemBuilder: (context, index) {
                        var resource = resourceCardsController.resources[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (index == 0)
                              const SizedBox(width: 2 * kSizeDefault),
                            Container(
                              width: 19 * kSizeDefault,
                              margin: const EdgeInsets.only(
                                left: kSizeDefault,
                                top: kSizeDefault,
                                bottom: kSizeDefault,
                              ),
                              child: CustomCard(
                                cardHoverController: CardHoverController(),
                                child: Container(
                                  width: double.infinity,
                                  color: Theme.of(context).colorScheme.primary,
                                  padding: const EdgeInsets.all(kSizeDefault),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              resource.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textDirection:
                                                  intl.Bidi.detectRtlDirectionality(
                                                          resource.title)
                                                      ? TextDirection.rtl
                                                      : TextDirection.ltr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        resource.semester,
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
                                      Text(
                                        resource.teacher,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (index ==
                                resourceCardsController.resources.length - 1)
                              const SizedBox(width: kSizeDefault),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 2 * kSizeDefault),
                  TitleHeading(
                    title: 'newReferences'.tr,
                    seeAllOnPressed: () {},
                  ),
                  SizedBox(
                    height: 22 * kSizeDefault,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: resourceCardsController.resources.length,
                      itemBuilder: (context, index) {
                        var reference =
                            referenceCardsController.references[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (index == 0)
                              const SizedBox(width: 2 * kSizeDefault),
                            Container(
                              width: 19 * kSizeDefault,
                              margin: const EdgeInsets.only(
                                left: kSizeDefault,
                                top: kSizeDefault,
                                bottom: kSizeDefault,
                              ),
                              child: CustomCard(
                                cardHoverController: CardHoverController(),
                                child: Container(
                                  color: Theme.of(context).colorScheme.primary,
                                  padding: const EdgeInsets.all(kSizeDefault),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              reference.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textDirection: intl.Bidi
                                                      .detectRtlDirectionality(
                                                          reference.title)
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
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
                                              textDirection: intl.Bidi
                                                      .detectRtlDirectionality(
                                                          reference.authors
                                                              .join(', '))
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
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (index ==
                                resourceCardsController.resources.length - 1)
                              const SizedBox(width: kSizeDefault),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
