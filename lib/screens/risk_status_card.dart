import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_status_card.dart';

class RiskStatusCard extends StatelessWidget {
  const RiskStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseStatusCard(
      backgroundColor: Color(0XFF5D97F8),
      foregroundColor: Colors.white,
      icon: Icons.coronavirus_outlined,
      label: 'COVID-19 Risk Status',
      text: 'Low Risk No Symptom',
    );
  }
}
