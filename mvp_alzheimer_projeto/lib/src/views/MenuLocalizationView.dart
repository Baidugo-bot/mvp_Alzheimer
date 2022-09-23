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
        automaticallyImplyLeading: false,
        backgroundColor: AppController.instance.mainColor,
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/');

              },
              child: Icon(Icons.arrow_back,size: 45,),
            ),
            Container(width: 10,),
            Center(child: Text("Map Page "))
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/localConfig');
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
                Navigator.of(context).pushNamed('/localization');
              },
              child: Container(
                child: Icon(
                    Icons.location_on,
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
