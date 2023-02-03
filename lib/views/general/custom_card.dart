import 'package:cse_archive/controllers/home/card_hover_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cardHoverController = CardHoverController();

    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              blurRadius: cardHoverController.hover.isTrue ? 7 : 2,
            ),
          ],
        ),
        child: MouseRegion(
          onEnter: (event) => cardHoverController.onEnter(),
          onExit: (event) => cardHoverController.onExit(),
          child: Stack(
            children: [
              child,
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPressed,
                    hoverColor: Colors.transparent,
                    splashColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    highlightColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.05),
                    customBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
