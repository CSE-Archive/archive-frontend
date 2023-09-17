import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:flutter/material.dart';

enum ArchiveErrorType { notFound, general }

class ArchiveError extends StatelessWidget {
  final String title;
  final String description;
  final Widget? button;
  final ArchiveErrorType type;

  const ArchiveError({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.type = ArchiveErrorType.general,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ),
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, 12),
                child: Text(
                  switch (type) {
                    ArchiveErrorType.notFound => '۴۰۴',
                    ArchiveErrorType.general => '!',
                  },
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
          ),
          const Gap.vertical(kSizeDefault / 2),
          SelectableText(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SelectableText(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
          if (button != null) ...[
            const Gap.vertical(kSizeDefault),
            button!,
          ],
        ],
      ),
    );
  }
}
