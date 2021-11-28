import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class NameAndICNumberSection extends StatelessWidget {
  final String name, icNumber;

  const NameAndICNumberSection({
    Key? key,
    required this.name,
    required this.icNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return Container(
          color: colorScheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: spacingLarge),
                child: Image.asset(
                  'assets/icon/icon.png',
                  width: pseudoSejahteraLogoWidth,
                  height: pseudoSejahteraLogoHeight,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: spacingSmall,
                ),
                child: Text(
                  name.toUpperCase(),
                  style: textTheme.headline5?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: spacingSmall,
                  bottom: spacingLarge,
                ),
                child: Text(
                  icNumber,
                  style: textTheme.subtitle2?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
