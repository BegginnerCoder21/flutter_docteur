// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_docteur/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarClientApp extends StatefulWidget implements PreferredSizeWidget {
 

  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String? TitreApp;
  final String? route;
  final FaIcon? icons;
  final List<Widget>? actions;

  const BarClientApp({
    Key? key,
    this.TitreApp,
    this.route,
    this.icons,
    this.actions,
  }) : super(key: key);

  @override
  State<BarClientApp> createState() => _BarClientAppState();
}

class _BarClientAppState extends State<BarClientApp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // pour dire si l'icon de retour est present ou non
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(widget.TitreApp!,style:const TextStyle(color: Colors.black,fontSize: 20),
     
      ),
      leading:widget.icons != null ? Container(
        margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Config.primaryColor
        ),
        child: IconButton(onPressed: (){
          // si la route est definie alors c'est iconButton qui
          // permettra de naviguer vers cette route là
          setState(() {
            
          if(widget.route== null){
            Navigator.of(context).pop();
          }else{
            Navigator.of(context).pushNamed(widget.route!);
          }
          });
        },
        icon:widget.icons!,
        iconSize: 16,
        color: Colors.white,
        ),
      ) : null,
      actions: widget.actions ?? null,
    );
  }
}
