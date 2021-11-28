import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_status_card.dart';
import 'package:pseudosejahtera/icons/pseudo_sejahtera_icons_icons.dart';

class VaccinationStatusCard extends StatelessWidget {
  const VaccinationStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseStatusCard(
      backgroundColor: Color(0XFFFDD774),
      foregroundColor: Colors.black,
      icon: PseudoSejahteraIcons.vaccines_outlined,
      label: 'COVID-19 Vaccination Status',
      text: 'Fully Vaccinated',
    );
  }
}
