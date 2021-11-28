import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/start_page/start_page_app_bar.dart';
import 'package:pseudosejahtera/screens/status_page/status_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PseudoScaffold(
      appBar: StartPageAppBar(),
      body: StatusPage(),
    );
  }
}
