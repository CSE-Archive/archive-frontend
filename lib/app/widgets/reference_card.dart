import 'package:cse_archive/app/constants/icons.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_network/image_network.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveReferenceCard extends StatelessWidget {
  final ReferenceModel reference;
  final double width;

  const ArchiveReferenceCard({
    super.key,
    required this.reference,
    this.width = kSizeCardWidth,
  });

  @override
  Widget build(BuildContext context) {
    const imageSize = 6 * kSizeDefault;

    final noImage = Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryColor),
      ),
      child: Center(
        child: Icon(
          ArchiveIcons.photoOff,
          size: 2 * kSizeDefault,
          color: context.secondaryColor,
        ),
      ),
    );

    return ArchiveCard(
      width: width,
      color: context.primaryColor,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () =>
          context.go('${ArchiveRoutes.references}/${reference.uuid}'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    reference.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.bodyLarge,
                  ),
                ),
                const Gap.vertical(kSizeDefault / 2),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    reference.writers.isEmpty
                        ? '—'
                        : reference.writers.join(', '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.bodySmall.copyWith(
                      color: context.secondaryColor.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap.horizontal(kSizeDefault),
          (reference.image != null)
              ? ImageNetwork(
                  duration: 0,
                  width: imageSize,
                  height: imageSize,
                  image: reference.image.toString(),
                  onError: noImage,
                  onLoading:
                      CircularProgressIndicator(color: context.secondaryColor),
                )
              : noImage,
        ],
      ),
    );
  }
}
