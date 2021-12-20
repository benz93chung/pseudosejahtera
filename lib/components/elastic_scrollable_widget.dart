import 'package:flutter/material.dart';

/// A widget that centralizes content, or be scrollable if content overflows past the screen
/// https://photos.app.goo.gl/SUA8Kgh5CJU1MuGXA
class ElasticScrollableWidget extends StatelessWidget {
  final List<Widget> children;

  /// Sticks to the bottom of the content.
  /// If scrollable, this widget sticks regardless of scrolling extent
  final Widget? stickyBottomWidget;

  /// Useful especially if content gets longer
  final ScrollController? controller;

  /// In effect if content overflows, making the widget scrollable
  final ScrollPhysics? physics;

  /// If true, children will be "centralized"
  final bool centerChildren;

  final Color? backgroundColor;

  const ElasticScrollableWidget({
    Key? key,
    required this.children,
    this.stickyBottomWidget,
    this.controller,
    this.physics,
    this.backgroundColor,
    this.centerChildren = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Stack(
      children: [
        ListView(
          physics: physics,
          controller: controller,
          shrinkWrap: true,
          children: children,
        ),
      ],
    );

    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: centerChildren
                ? Center(
                    child: content,
                  )
                : content,
          ),
          stickyBottomWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
