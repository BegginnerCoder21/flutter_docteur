import 'package:application_docteur/Ecrans/page_acceuil.dart';
import 'package:application_docteur/Ecrans/page_rendez_vous.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class mainLayout extends StatefulWidget {
  const mainLayout({super.key});

  @override
  State<mainLayout> createState() => _mainLayoutState();
}

class _mainLayoutState extends State<mainLayout> {
  int _pageCourante = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: (value) {
          setState(() {
            _pageCourante = value;
          });
        },
        children: [
          const PageAcceuil(),
          PageRendezVous(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageCourante,
        onTap: (page) {
          setState(() {
            _pageCourante = page;
            _page.animateToPage(page,
                duration:const Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
        items:const  <BottomNavigationBarItem>[BottomNavigationBarItem(
          label: "Acceuil",
          icon: FaIcon(FontAwesomeIcons.houseChimneyMedical)
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
          label: "Rendez-vous",
          )
          ],
      ),
    );
  }
}
