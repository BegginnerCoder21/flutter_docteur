import 'package:application_docteur/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RendezvousReserver extends StatelessWidget {
  const RendezvousReserver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset('assets/success.json'),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Réservation Réussie',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Config.primaryColor),
                    onPressed: () {
                      Navigator.of(context).pushNamed('main');
                    },
                    child: const Text(
                      'Retour a la page d\'acceuil',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ))
        ],
      )),
    );
  }
}
