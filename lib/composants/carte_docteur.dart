// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:application_docteur/utils/config.dart';

class CarteDocteur extends StatelessWidget {
  final String route;
  Map<String, dynamic> docteur = {};
   CarteDocteur({
    Key? key,
    required this.route,
    required this.docteur
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 150,
      child: GestureDetector(
          child: Card(
            elevation: 5,
            color: Config.primaryColor,
            child: Row(
              children: [
                SizedBox(
                    width: Config.tailleLargeur * 0.45,
                    child: Image.network(
                      "http://10.0.2.2:8000${docteur['docteur_profile']}",
                      fit: BoxFit.fill,
                    )),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "Dr ${docteur['docteur_name']}",
                          style:const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "${docteur['category']}",
                          style:const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Text("4.5"),
                            Spacer(
                              flex: 2,
                            ),
                            Text("Revoir"),
                            Spacer(
                              flex: 2,
                            ),
                            Text("(20)"),
                            Spacer(
                              flex: 5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(route,arguments: docteur);
          } //Rediriger vers les details de l'application,
          ),
    );
  }
}
