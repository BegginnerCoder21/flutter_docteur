// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_docteur/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Boutonconnexion extends StatelessWidget {
  const Boutonconnexion({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.width,
    required this.desactive,
  }) : super(key: key);
  @override
  final String title;
  final Function() onPressed;
  final double width;
  final bool desactive;

  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Config.primaryColor,
            foregroundColor: Colors.white
          ),
            onPressed: desactive ? null : onPressed,
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )));
  }
}
