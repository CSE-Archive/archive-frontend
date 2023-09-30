import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/constants/strings.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/text_theme.dart';
import 'package:cse_archive/app/models/classroom.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/utils/en_to_fa_digits.dart';
import 'package:cse_archive/app/widgets/divider.dart';
import 'package:cse_archive/app/widgets/expansion_tile.dart';
import 'package:flutter/material.dart';

class CourseExpansionTile extends StatelessWidget {
  final int year;
  final ClassroomSemester semester;
  final List<ResourceModel> resources;
  final List<ProfessorModel> professors;
  final List<String> tas;

  const CourseExpansionTile({
    super.key,
    required this.year,
    required this.semester,
    required this.resources,
    required this.professors,
    required this.tas,
  });

  @override
  Widget build(BuildContext context) {
    return ArchiveExpansionTile(
      title: Text(
        '$semester ${enToFaDigits(year.toString())}',
        style: context.bodyLarge,
      ),
      subtitle: professors.isEmpty
          ? null
          : Text(
              professors
                  .map(
                    (professor) => professor.fullNameWithHonorific,
                  )
                  .join(', '),
              softWrap: true,
              style: context.bodyMedium.copyWith(
                color: context.secondaryColor.withOpacity(0.7),
              ),
            ),
      children: [
        Container(
          width: double.infinity,
          color: context.secondaryColor.withOpacity(0.2),
          padding: const EdgeInsets.all(kSizeDefault),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (tas.isNotEmpty) ...[
                Text(
                  ArchiveStrings.courseTAs,
                  style: context.bodySmall.copyWith(
                    color: context.secondaryColor.withOpacity(0.8),
                  ),
                ),
                Text(
                  tas.join(', '),
                  style: context.bodyMedium,
                ),
                ArchiveDivider(
                  color: context.secondaryColor,
                  margin: const EdgeInsets.symmetric(vertical: kSizeDefault),
                ),
              ],
              Wrap(
                spacing: kSizeDefault,
                runSpacing: kSizeDefault,
                children: resources
                    .map(
                      (resource) => ElevatedButton(
                        onPressed: () {}, // TODO,
                        child: Text(
                          resource.title ?? resource.type.representation,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
