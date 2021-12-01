import 'package:flutter/material.dart';

class CheckInDetailsField extends StatelessWidget {
  final String label, value;
  final CrossAxisAlignment alignment;

  const CheckInDetailsField({
    Key? key,
    required this.label,
    required this.value,
    this.alignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: textTheme.caption,
            ),
            Text(
              value,
              style: textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }
}
