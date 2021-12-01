import 'package:flutter/material.dart';

/// A widget that centralizes content, or be scrollable if content overflows past the screen
/// https://photos.app.goo.gl/SUA8Kgh5CJU1MuGXA
class CenterToScrollableWidget extends StatelessWidget {
  final List<Widget> children;

  /// Sticks to the bottom of the content.
  /// If scrollable, this widget sticks regardless of scrolling extent
  final Widget? stickyBottomWidget;

  /// Useful especially if content gets longer
  final ScrollController? controller;

  /// In effect if content overflows, making the widget scrollable
  final ScrollPhysics? physics;

  const CenterToScrollableWidget({
    Key? key,
    required this.children,
    this.stickyBottomWidget,
    this.controller,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                physics: physics,
                controller: controller,
                shrinkWrap: true,
                children: children,
              ),
            ),
            stickyBottomWidget ?? const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
