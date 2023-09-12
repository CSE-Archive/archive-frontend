import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/models/classroom.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:cse_archive/app/widgets/divider.dart';
import 'package:flutter/material.dart';

class CourseExpansionTile extends StatelessWidget {
  final int year;
  final ClassroomSemester semester;
  final List<ProfessorModel> professors;
  final List<ResourceModel>? resources;
  final RecordedClassroomModel? recordings;
  final List<String> tas;

  const CourseExpansionTile({
    super.key,
    required this.year,
    required this.semester,
    required this.professors,
    this.resources,
    this.recordings,
    this.tas = const [],
  })  : assert(
          resources != null || recordings != null,
          'One of resources or recordings must not be null',
        ),
        assert(
          resources == null || recordings == null,
          'One of resources or recordings must be null',
        );

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        '$semester ${enToFaDigits(year.toString())}',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        professors
            .map(
              (professor) => professor.fullNameWithHonorific,
            )
            .join(', '),
        softWrap: true,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            ),
      ),
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          padding: const EdgeInsets.all(kSizeDefault),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (tas.isNotEmpty) ...[
                Text(
                  ArchiveStrings.courseTAs,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                      ),
                ),
                Text(
                  tas.join(', '),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ArchiveDivider(
                  color: Theme.of(context).colorScheme.secondary,
                  margin: const EdgeInsets.symmetric(vertical: kSizeDefault),
                ),
              ],
              // TODO: Add download buttons
              Wrap(
                spacing: kSizeDefault,
                runSpacing: kSizeDefault,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
