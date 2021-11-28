import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class BaseCard extends StatelessWidget {
  final Widget child;

  const BaseCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: baseCardElevation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacingMid),
        child: child,
      ),
    );
  }
}
