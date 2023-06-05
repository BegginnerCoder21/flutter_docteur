// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:application_docteur/utils/config.dart';

import 'package:application_docteur/utils/config.dart';

class BoutonSocial extends StatelessWidget {
  
  final String social;

  const BoutonSocial({
    Key? key,
    required this.social,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding:const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        side: const BorderSide(width: 1,color: Colors.grey)
      ),
      onPressed: () {},
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/$social.png',
              width: 33,
              height: 40,
            ),
            SizedBox(width: 10,),
            Text(
              social.toUpperCase(),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
