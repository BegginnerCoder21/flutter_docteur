import 'package:application_docteur/composants/Carte_Render_Vous.dart';
import 'package:application_docteur/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageRendezVous extends StatefulWidget {
  PageRendezVous({super.key});

  @override
  State<PageRendezVous> createState() => _PageRendezVousState();
}

enum FiltrerStatut { upcoming, completed, cancel }

class _PageRendezVousState extends State<PageRendezVous> {
  List<dynamic> schedules = [
    {
      "nom_docteur": "Dr Ayanokôji Kiyotaka",
      "image_docteur": "assets/docteur2.jpg",
      "category": "Dentiste",
      "statut": FiltrerStatut.upcoming
    },
    {
      "nom_docteur": "Dr Suzuya Juzo",
      "image_docteur": "assets/docteur3.jpg",
      "category": "Cardiologue",
      "statut": FiltrerStatut.completed
    },
    {
      "nom_docteur": "Dr Ligth Yagami",
      "image_docteur": "assets/docteur4.jpg",
      "category": "Genetaliste",
      "statut": FiltrerStatut.cancel
    },
    {
      "nom_docteur": "Dr Kaneki Ken",
      "image_docteur": "assets/docteur1.jpg",
      "category": "Dermatologue",
      "statut": FiltrerStatut.completed
    }
  ];
  Alignment _alignment = Alignment.centerLeft;
  FiltrerStatut statut = FiltrerStatut.upcoming;

  @override
  Widget build(BuildContext context) {
    List<dynamic> filtrerSchdule = schedules.where((var schedule) {
      return schedule["statut"] == statut;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Gestion des Rendez-vous",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.petitEspacement,
            Stack(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      for (FiltrerStatut filtrerStatut in FiltrerStatut.values)
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (filtrerStatut == FiltrerStatut.upcoming) {
                                statut = FiltrerStatut.upcoming;
                                _alignment = Alignment.centerLeft;
                              } else if (filtrerStatut ==
                                  FiltrerStatut.completed) {
                                statut = FiltrerStatut.completed;
                                _alignment = Alignment.center;
                              } else if (filtrerStatut ==
                                  FiltrerStatut.cancel) {
                                statut = FiltrerStatut.cancel;
                                _alignment = Alignment.centerRight;
                              }
                            });
                          },
                          child: Center(child: Text(filtrerStatut.name)),
                        ))
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 100,
                    height: 40,
                    child: Center(
                      child: Text(
                        statut.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Config.petitEspacement,
            Expanded(
                child: ListView.builder(
                    itemCount: filtrerSchdule.length,
                    itemBuilder: ((context, index) {
                      var schedule = filtrerSchdule[index];
                      bool estDernierElement =
                          filtrerSchdule.length - 1 == index;
                      return Card(
                        shape: RoundedRectangleBorder(
                            side:const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                            margin: !estDernierElement ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
                            child: Padding(padding:const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(schedule["image_docteur"]),
                                    ),
                                    const SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(schedule["nom_docteur"],style:const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontSize: 15
                                        ),),
                                        const SizedBox(height: 3,),                                        
                                        Text(schedule["category"],style:const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontSize: 12
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                CarteHoraire(colors: Config.primaryColor, date: "Lundi, 11/12/2023", couleurFond: Colors.grey.shade400, heure: "15:00"),
                              const SizedBox(height: 15,),
                              Row(
                                
                                children: [
                                Expanded(child: OutlinedButton(onPressed: (){}, 
                                child:const Text("Annuler",style: TextStyle(
                                  color: Config.primaryColor
                                )
                                ,)
                                )
                                ),
                                const SizedBox(width: 10,),
                                Expanded(child: OutlinedButton(onPressed: (){}, 
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Config.primaryColor
                                ),
                                child:const Text("Reprogrammer",style: TextStyle(
                                  color: Colors.white
                                )
                                ,)
                                )
                                ),
                              ],)
                              ],
                            ),
                            ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
