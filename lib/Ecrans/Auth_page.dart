import 'package:application_docteur/composants/Bouton_connexion.dart';
import 'package:application_docteur/composants/bouton_social.dart';
import 'package:application_docteur/composants/formulare_connexion.dart';
import 'package:application_docteur/utils/config.dart';
import 'package:application_docteur/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
            child: ListView(
          children: [
            Text(
              AppText.enText["text_bienvenue"]!,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Config.petitEspacement,
            Text(
              AppText.enText["text_connexion"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Config.petitEspacement,
            const FormConnexion(),
            Boutonconnexion(
                title: "Connexion",
                onPressed: () {
                  Navigator.of(context).pushNamed('main');
                },
                width: double.infinity,
                desactive: false),
            TextButton(
              onPressed: () {
                
              },
              child: Center(
                child: Text(
                  AppText.enText["motDePasse_oublié"]!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 110,
            ),
            Center(
                child: Text(
              AppText.enText["identifiant_social"]!,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500),
            )),
            Config.petitEspacement,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BoutonSocial(social: "facebook"),
               SizedBox(width: 10,),
                BoutonSocial(social: "google"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.enText["text_enregistrement"]!,
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                const Text(
                  "S'inscrire",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
