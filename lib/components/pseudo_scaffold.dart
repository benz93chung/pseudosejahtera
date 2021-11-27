import 'package:flutter/material.dart';

class PseudoScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget body;

  const PseudoScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.background,
      appBar: appBar,
      body: SafeArea(child: body),
    );
  }
}
