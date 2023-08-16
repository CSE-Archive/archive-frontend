import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gap.dart';
import 'card.dart';

class ArchiveProfessorCard extends StatelessWidget {
  final ProfessorModel? professor;

  const ArchiveProfessorCard({
    super.key,
    required this.professor,
  });

  const ArchiveProfessorCard.invisible({super.key}) : professor = null;

  @override
  Widget build(BuildContext context) {
    final child = ArchiveCard(
      width: kSizeCardWidth,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(kSizeDefault),
      onPressed: () =>
          context.go('${ArchiveRoutes.professors}/${professor?.id}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${professor?.honorific} ${professor?.fullName}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap.vertical(kSizeDefault / 2),
          Text(
            '${ArchiveStrings.professorDepartment} ${professor?.department}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
          ),
          const Gap.vertical(kSizeDefault),
          Container(
            width: double.infinity,
            height: kSizeCardWidth / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(professor?.image ?? ''),
                fit: BoxFit.cover,
              ),
              border:
                  Border.all(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );

    if (professor == null) {
      return Opacity(
        opacity: 0,
        child: IgnorePointer(child: child),
      );
    }

    return child;
  }
}
