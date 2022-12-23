import 'package:cse_archive/views/general_components/basic_web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return basicWebPage(
      context: context,
      body: Center(
        child: Text(
          'loading'.tr,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ),
    );
  }
}
