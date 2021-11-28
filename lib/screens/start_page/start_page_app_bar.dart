import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/pseudo_button.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class StartPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StartPageAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return AppBar(
          elevation: 0,
          backgroundColor: theme.colorScheme.primary,
          title: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.refresh,
                  size: refreshStatusIconSize,
                  color: theme.colorScheme.onPrimary,
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: spacingXSmall)),
                Text(
                  'Refresh Status',
                  style: theme.textTheme.button?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          actions: [
            PseudoButton(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(
                    circularRadius,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: spacingMid,
                    vertical: spacingSmall,
                  ),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
