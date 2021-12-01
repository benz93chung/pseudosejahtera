import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final double? elevation;

  const BaseCard({
    Key? key,
    required this.child,
    this.radius = midRadius,
    this.elevation = baseCardElevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: elevation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: child,
      ),
    );
  }
}
