import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/web_page/components/footer.dart';
import 'package:flutter/material.dart';

import 'components/appbar.dart';

class ArchiveWebPage extends StatelessWidget {
  final Widget body;
  final double bodyPadding;
  final bool applyPlatformConstraints;

  const ArchiveWebPage({
    super.key,
    required this.body,
    this.bodyPadding = 3 * kSizeDefault,
    this.applyPlatformConstraints = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: [
          appbar(context: context),
          SliverToBoxAdapter(child: Gap.vertical(bodyPadding)),
          SliverToBoxAdapter(
            child: Center(
              child: applyPlatformConstraints
                  ? Container(
                      constraints:
                          BoxConstraints(maxWidth: context.platform.maxWidth),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.platform.margin,
                      ),
                      child: body,
                    )
                  : body,
            ),
          ),
          SliverToBoxAdapter(child: Gap.vertical(bodyPadding)),
          SliverToBoxAdapter(child: footer(context: context)),
        ],
      ),
    );
  }
}
