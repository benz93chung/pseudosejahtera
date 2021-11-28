import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class PseudoOutlinedButton extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback onPressed;
  final Color? backgroundColor, foregroundColor;

  const PseudoOutlinedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(
      horizontal: spacingSmall,
      vertical: spacingMid,
    ),
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textTheme.button;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: backgroundColor ?? Theme.of(context).colorScheme.primary,
        side: BorderSide(
          color: foregroundColor ?? Theme.of(context).colorScheme.primary,
          width: outlineBtnWidth,
        ),
        textStyle: foregroundColor != null ? buttonTextStyle?.copyWith(color: foregroundColor) : null,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: spacingSmall,
          vertical: spacingMid,
        ),
        child: child,
      ),
    );
  }
}
