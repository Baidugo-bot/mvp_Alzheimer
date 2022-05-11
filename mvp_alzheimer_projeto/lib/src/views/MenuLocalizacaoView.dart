import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';


class MenuLocalizacaoView extends StatefulWidget {
  const MenuLocalizacaoView({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MenuLocalizacaoView> createState() => MenuLocalizacaoViewState();
}

class MenuLocalizacaoViewState extends State<MenuLocalizacaoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(// map dos botoes
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Dia ")),
      ),
      body: Column(
        children: [
          Container(
            child: Icon(Icons.edit),
          ),
          Container(
            child: Icon(Icons.edit),
          ),
        ],
      ),

    );
  }



}
