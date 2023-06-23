import 'dart:ffi';

import 'package:application_docteur/composants/bar_client_app.dart';
import 'package:application_docteur/main.dart';
import 'package:application_docteur/models/rendezvous_conversiondate.dart';
import 'package:application_docteur/providers/dio_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:application_docteur/utils/config.dart';
import 'package:intl/date_symbol_data_local.dart';

class ListeRendezVous extends StatefulWidget {
  const ListeRendezVous({super.key});

  @override
  State<ListeRendezVous> createState() => _ListeRendezVousState();
}

class _ListeRendezVousState extends State<ListeRendezVous> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusJours = DateTime.now();
  DateTime _JoursCourant = DateTime.now();
  int? _indexCourant;
  bool _estWeekend = false;
  bool _dateSelectionne = true;
  bool _heureSelectionne = false;
  String? token;
  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final docteur = ModalRoute.of(context)!.settings.arguments as Map;

    Config().init(context);
    return Scaffold(
      appBar: const BarClientApp(
        icons: FaIcon(Icons.arrow_back_ios),
        TitreApp: "Rendez-Vous",
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                tableCalandar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      'Selectionner l\'heure de consultation',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          _estWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 25,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Weekend non disponible, veillez choisir un autre jour SVP.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _indexCourant = index;
                          _heureSelectionne = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _indexCourant == index
                                  ? Colors.white
                                  : Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          color: _indexCourant == index
                              ? Config.primaryColor
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 9}:00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _indexCourant == index ? Colors.white : null),
                        ),
                      ),
                    );
                  }, childCount: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5),
                ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Container(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Config.primaryColor,
                  ),
                  onPressed: _heureSelectionne && _dateSelectionne
                      ? () async {
                          final getdate = DateConvertie.getDate(_JoursCourant);
                          final gettime = DateConvertie.getTime(_indexCourant!);
                          final getday =
                              DateConvertie.getDay(_JoursCourant.weekday);

                          final reservation = await DioProvider().reservation(
                              getdate,
                              getday,
                              gettime,
                              docteur['docteur_id'],
                              token!);
                          if (reservation == 200) {
                            MyApp.navigatorKey.currentState!
                                .pushNamed('reservationReussie');
                          } else {
                            print(reservation);
                          }
                        }
                      : null,
                  child: const Text(
                    'Prendre rendez vous',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tableCalandar() {
    return TableCalendar(
      locale: 'fr_FR',
      focusedDay: _focusJours,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      currentDay: _JoursCourant,
      calendarFormat: _format,
      rowHeight: 43,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Config.primaryColor, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((jourSelectionne, focusJour) {
        setState(() {
          _JoursCourant = jourSelectionne;
          _focusJours = focusJour;
          _dateSelectionne = true;

          if (jourSelectionne.weekday == 6 || jourSelectionne.weekday == 7) {
            _estWeekend = true;
            _heureSelectionne = false;
            _indexCourant = null;
          } else {
            _estWeekend = false;
          }
        });
      }),
    );
  }
}
