// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:application_docteur/composants/bar_client_app.dart';
import 'package:application_docteur/utils/config.dart';

class DetailsDocteur extends StatefulWidget {
  const DetailsDocteur({super.key});

  @override
  State<DetailsDocteur> createState() => _DetailsDocteurState();
}

class _DetailsDocteurState extends State<DetailsDocteur> {
  bool estFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarClientApp(
        TitreApp: "Les details sur le docteur",
        icons: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                estFav = !estFav;
              });
            },
            icon: FaIcon(
                estFav ? Icons.favorite_rounded : Icons.favorite_outline),
            color: Colors.red,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuSujetDocteur(),
            const DetailCorps(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // nous enmenera sur la page de la liste des rendez-vous
                    setState(() {
                      Navigator.of(context).pushNamed("ListeRendezVous");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Config.primaryColor),
                  child: const Text(
                    "Liste des rendez-vous",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AuSujetDocteur extends StatefulWidget {
  const AuSujetDocteur({super.key});

  @override
  State<AuSujetDocteur> createState() => _AuSujetDocteurState();
}

class _AuSujetDocteurState extends State<AuSujetDocteur> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/docteur2.jpg"),
          ),
          Config.espacementNormal,
          const Text(
            "Dr Ayanokôji Kiyotaka",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Config.petitEspacement,
          SizedBox(
            width: Config.tailleLargeur * 0.80,
            child: const Text(
              "MBBC (Université internationale de medecine,Côte d'ivoire) MRCP (Collège Royal des physiciens ,Mamie Adjoua de cocody)",
              softWrap: true,
              style: TextStyle(color: Colors.grey, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Config.petitEspacement,
          SizedBox(
            width: Config.tailleLargeur * 0.80,
            child: const Text(
              "Centre hospitalier unviersitaire",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailCorps extends StatelessWidget {
  const DetailCorps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Config.petitEspacement,
          const InfoDocteur(),
          Config.espacementNormal,
          const Text(
            "Au sujet du docteur",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          Config.petitEspacement,
          const Text(
            "Dr. Ayanokôji Kiyotaka as une experience de dentiste au centre hospitalier universiatiare de treichville. Il est diplomé depuis 2008, et affine son savoir faire au centre hospitalier unversiataire de cocody.",
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, height: 1.2),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class InfoDocteur extends StatelessWidget {
  const InfoDocteur({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: const [
        Infocarte(label: "Partients", value: "100"),
        SizedBox(
          width: 10,
        ),
        Infocarte(label: "Experiences", value: "10 ans"),
        SizedBox(
          width: 10,
        ),
        Infocarte(label: "Notes", value: "4.5"),
      ],
    ));
  }
}

class Infocarte extends StatelessWidget {
  final String label;
  final String value;
  const Infocarte({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Config.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: const TextStyle(
              fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
        )
      ]),
    ));
  }
}
