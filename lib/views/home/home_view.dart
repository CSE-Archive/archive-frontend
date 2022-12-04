import 'package:cse_archive/constants.dart';
import 'package:cse_archive/controllers/home/reference_cards_controller.dart';
import 'package:cse_archive/controllers/home/resource_cards_controller.dart';
import 'package:cse_archive/views/general_components/appbar_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/see_all_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var resourceCardsController = Get.find<ResourceCardsController>();
    var referenceCardsController = Get.find<ReferenceCardsController>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: kColorPrimary.withOpacity(0.5),
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                margin: const EdgeInsets.only(
                                  left: kSizeDefault,
                                  top: kSizeDefault,
                                  bottom: kSizeDefault,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(kSizeDefault),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            resource.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: kColorPrimary),
                                          ),
                                          const Spacer(),
                                          Text(
                                            resource.semester,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: kColorPrimary
                                                      .withOpacity(0.7),
                                                ),
                                          ),
                                          Text(
                                            resource.teacher,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: kColorPrimary
                                                      .withOpacity(0.7),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {},
                                          hoverColor: Colors.transparent,
                                          splashColor:
                                              kColorPrimary.withOpacity(0.1),
                                          highlightColor:
                                              kColorPrimary.withOpacity(0.05),
                                          customBorder:
                                              const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: kColorPrimary.withOpacity(0.5),
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                margin: const EdgeInsets.only(
                                  left: kSizeDefault,
                                  top: kSizeDefault,
                                  bottom: kSizeDefault,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(kSizeDefault),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            reference.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: kColorPrimary),
                                          ),
                                          const SizedBox(
                                              height: kSizeDefault / 2),
                                          Text(
                                            reference.authors.join(', '),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: kColorPrimary
                                                      .withOpacity(0.7),
                                                ),
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
                                                  color: kColorPrimary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {},
                                          hoverColor: Colors.transparent,
                                          splashColor:
                                              kColorPrimary.withOpacity(0.1),
                                          highlightColor:
                                              kColorPrimary.withOpacity(0.05),
                                          customBorder:
                                              const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}

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
