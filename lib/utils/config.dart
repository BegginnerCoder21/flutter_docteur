import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? largeurEcrans;
  static double? hauteurEcrans;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    largeurEcrans = mediaQueryData!.size.width;
    hauteurEcrans = mediaQueryData!.size.height;
  }

  static get tailleLargeur {
    return largeurEcrans;
  }

  static get tailleHauteur {
    return hauteurEcrans;
  }

  // definition de la haiteur d'espacement

  static const petitEspacement = SizedBox(
    height: 20,
  );

  static final espacementNormal = SizedBox(
    height: hauteurEcrans! * 0.05,
  );

  static final grandEspacement = SizedBox(
    height: hauteurEcrans! * 0.08,
  );
//  stylisation des champs de text
  static const outlineBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)));

  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.greenAccent));

  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red));

  static const primaryColor = Colors.greenAccent;
}
