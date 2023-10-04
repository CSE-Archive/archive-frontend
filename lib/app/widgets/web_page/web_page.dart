import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/controllers/general.dart';
import 'package:cse_archive/app/extensions/color_scheme.dart';
import 'package:cse_archive/app/extensions/responsive.dart';
import 'package:cse_archive/app/themes.dart';
import 'package:cse_archive/app/widgets/gap.dart';
import 'package:cse_archive/app/widgets/web_page/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/appbar.dart';

class ArchiveWebPage extends StatelessWidget {
  final Widget body;
  final bool applyPlatformConstraints;
  final bool applyPlatformVerticalPadding;
  final Future<void> Function() onRefresh;

  const ArchiveWebPage({
    super.key,
    required this.body,
    required this.onRefresh,
    this.applyPlatformConstraints = true,
    this.applyPlatformVerticalPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final generalController = Get.find<GeneralController>();

    generalController.addScaffoldKey(scaffoldKey);

    final verticalPadding =
        context.isMobileOrTablet ? 2 * kSizeDefault : 3 * kSizeDefault;

    final scaffold = Scaffold(
      key: scaffoldKey,
      drawerScrimColor: context.shadowColor.withOpacity(0.5),
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
                        200, // 200 is approximal footer height
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

    return context.responsiveBuilder(
      mobile: RefreshIndicator(
        color: context.secondaryColor,
        backgroundColor: context.primaryColor,
        onRefresh: onRefresh,
        child: scaffold,
      ),
      desktop: scaffold,
    );
  }
}
