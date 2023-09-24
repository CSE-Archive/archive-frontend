import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/themes.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/web_page/components/footer.dart';
import 'package:flutter/material.dart';

import 'components/appbar.dart';

class ArchiveWebPage extends StatelessWidget {
  final Widget body;
  final bool applyPlatformConstraints;
  final bool applyPlatformVerticalPadding;

  const ArchiveWebPage({
    super.key,
    required this.body,
    this.applyPlatformConstraints = true,
    this.applyPlatformVerticalPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    const footerHeight = 200;

    final verticalPadding =
        context.isMobileOrTablet ? 2 * kSizeDefault : 3 * kSizeDefault;

    return Scaffold(
      drawerScrimColor: context.shadowColor.withOpacity(0.1),
      drawer:
          context.isMobileOrTablet ? ArchiveSliverAppbar.drawer(context) : null,
      body: CustomScrollView(
        primary: true,
        slivers: [
          const ArchiveSliverAppbar(),
          if (applyPlatformVerticalPadding)
            SliverToBoxAdapter(
              child: Gap.vertical(verticalPadding),
            ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: context.screenHeight -
                        ArchiveThemes.appbarHeight(context) -
                        (applyPlatformVerticalPadding
                            ? 2 * verticalPadding
                            : 0) -
                        footerHeight,
                  ),
                  child: applyPlatformConstraints
                      ? Container(
                          constraints: BoxConstraints(
                            maxWidth: context.platform.maxWidth,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: context.platform.margin,
                          ),
                          child: body,
                        )
                      : body),
            ),
          ),
          if (applyPlatformVerticalPadding)
            SliverToBoxAdapter(
              child: Gap.vertical(verticalPadding),
            ),
          SliverToBoxAdapter(
            child: footer(context: context),
          ),
        ],
      ),
    );
  }
}
