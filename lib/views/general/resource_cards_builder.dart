import 'package:cse_archive/constants.dart';
import 'package:cse_archive/models/resource_model.dart';
import 'package:cse_archive/views/general/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

Widget resourceCardsBuilder({
  required List<ResourceModel> resources,
  bool wrap = false,
}) {
  return SizedBox(
    height: kSizeResourceCardHeight,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: resources.length,
      itemBuilder: (context, index) {
        var resource = resources[index];
        return Container(
          width: kSizeCardWidth,
          height: kSizeResourceCardHeight,
          margin: const EdgeInsets.all(kSizeDefault / 2),
          child: CustomCard(
            onPressed: () => Get.toNamed(
              '/courses/1/test',
            ),
            child: Container(
              width: double.infinity,
              height: kSizeResourceCardHeight,
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
                          resource.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection:
                              intl.Bidi.detectRtlDirectionality(resource.title)
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    resource.semester,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.7),
                        ),
                  ),
                  Text(
                    resource.teacher,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
        );
      },
    ),
  );
}
