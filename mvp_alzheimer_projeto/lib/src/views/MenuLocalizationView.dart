import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';


class MenuLocalizationView extends StatefulWidget {
  const MenuLocalizationView({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MenuLocalizationView> createState() => MenuLocalizationViewState();
}

class MenuLocalizationViewState extends State<MenuLocalizationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(// map dos botoes
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Dia ")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/localization');
              },
              child: Container(
                child: Icon(
                    Icons.qr_code,
                    size: 200
                ),
              ),
            ),
            InkWell(
              onTap: (){
                //Navigator.of(context).pushNamed('/localization');
              },
              child: Container(
                child: Icon(
                    Icons.qr_code,
                    size: 200
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }



}
