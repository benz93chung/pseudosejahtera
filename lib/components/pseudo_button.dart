import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class PseudoButton extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback onPressed;
  final double? minWidth;
  final double? elevation;

  const PseudoButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.all(spacingSmall),
    this.minWidth,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return MaterialButton(
          onPressed: onPressed,
          padding: padding,
          color: colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(spacingSmall),
            child: child,
          ),
          minWidth: minWidth,
          elevation: elevation,
        );
      },
    );
  }
}
