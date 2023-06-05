import 'package:application_docteur/composants/Carte_Render_Vous.dart';
import 'package:application_docteur/composants/carte_docteur.dart';
import 'package:application_docteur/utils/config.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  List<Map<String, dynamic>> metCat = [
    {"icon": FontAwesomeIcons.userDoctor, "Category": "Generale"},
    {"icon": FontAwesomeIcons.heartPulse, "Category": "Cardiologie"},
    {"icon": FontAwesomeIcons.lungs, "Category": "Respirations"},
    {"icon": FontAwesomeIcons.hand, "Category": "Dermatologie"},
    {"icon": FontAwesomeIcons.personPregnant, "Category": "Gynécologie"},
    {"icon": FontAwesomeIcons.teeth, "Category": "Dentaire"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Christina",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage("assets/profile1.jpg"),
                      ),
                    )
                  ],
                ),
                Config.espacementNormal,
                const Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Config.petitEspacement,
                SizedBox(
                  height: Config.tailleHauteur * 0.07,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(metCat.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              FaIcon(
                                metCat[index]["icon"],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                metCat[index]["Category"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.petitEspacement,
                const Text(
                  "Rendez-vous d'aujourd'huit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Config.petitEspacement,
                const CarteRendezVous(),
                Config.petitEspacement,
                const Text(
                  "Top docteur",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Config.petitEspacement,
                Column(
                  children: List.generate(10, (index) {
                    return const CarteDocteur(
                      route: "Doc_details",
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
