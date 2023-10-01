import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveResourceCard extends StatelessWidget {
  final ResourceModel resource;
  final double width;

  const ArchiveResourceCard({
    super.key,
    required this.resource,
    this.width = kSizeCardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ArchiveCard(
      width: width,
      color: context.primaryColor,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () =>
          context.go('${ArchiveRoutes.resources}/${resource.uuid}'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${resource.title ?? resource.type.concatenation} ${resource.classroom!.course.title}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault),
          Text(
            enToFaDigits(
              '${resource.classroom!.semester} ${resource.classroom!.year}',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.bodySmall.copyWith(
              color: context.secondaryColor.withOpacity(0.8),
            ),
          ),
          Text(
            resource.classroom!.professors
                .map(
                  (professor) => professor.fullNameWithHonorific,
                )
                .join(', '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.bodySmall.copyWith(
              color: context.secondaryColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
