// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:application_docteur/utils/config.dart';

class CarteRendezVous extends StatefulWidget {
  const CarteRendezVous({super.key});

  @override
  State<CarteRendezVous> createState() => _CarteRendezVousState();
}

class _CarteRendezVousState extends State<CarteRendezVous> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage("assets/docteur2.jpg"),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Dr Ayanokôji Kiyotaka",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      "Dentiste",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Config.petitEspacement,
             CarteHoraire(
              colors: Colors.white,
              date: "Lundi, 11/06/2023",
              couleurFond: Colors.grey,
              heure: "12:00",
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {},
                    child: const Text(
                      "Annuler",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text(
                      "Completer",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CarteHoraire extends StatelessWidget {
  Color colors = Colors.white;
  String date = "";
  Color couleurFond = Colors.grey;
  String heure = "";
  CarteHoraire({
    Key? key,
    required this.colors,
    required this.date,
    required this.couleurFond,
    required this.heure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: couleurFond, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.calendar_today,
              color: colors,
              size: 16,
            ),
            Text(
              date,
              style: TextStyle(color: colors,fontSize: 16,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.access_alarm,
              size: 18,
              color: colors,
            ),
            Text(
              heure,
              style: TextStyle(color: colors, fontSize: 17,fontWeight: FontWeight.bold  ),
            )
          ],
        ),
      ),
    );
  }
}
