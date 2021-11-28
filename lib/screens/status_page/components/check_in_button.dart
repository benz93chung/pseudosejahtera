import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/pseudo_button.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class CheckInButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const CheckInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return PseudoButton(
          child: Padding(
            padding: const EdgeInsets.all(spacingSmall),
            child: Text(
              'Check-in',
              key: const ValueKey('check_in_button'),
              style: textTheme.button?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onPressed: onPressed,
          minWidth: double.infinity,
        );
      },
    );
  }
}
