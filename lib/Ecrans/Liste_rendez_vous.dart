import 'dart:ffi';

import 'package:application_docteur/composants/bar_client_app.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ListeRendezVous extends StatefulWidget {
  const ListeRendezVous({super.key});

  @override
  State<ListeRendezVous> createState() => _ListeRendezVousState();
}

class _ListeRendezVousState extends State<ListeRendezVous> {
  DateTime _focusJours = DateTime.now();
  DateTime _JoursCourant = DateTime.now();
  int? _indexCourant;
  bool _estWeekend = false;
  bool _dateSelectionne = false;
  bool _heureSelectionne = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BarClientApp(
        icons: FaIcon(Icons.arrow_back_ios),
        TitreApp: "Rendez-Vous",
      ),
    );
  }
}
