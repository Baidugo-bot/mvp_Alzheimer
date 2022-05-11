import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';


class LocalizationView extends StatefulWidget {
  const LocalizationView({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<LocalizationView> createState() => LocalizationViewState();
}

class LocalizationViewState extends State<LocalizationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(// map dos botoes
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Dia ")),
      ),
      body: Text("teste"),

    );
  }



}
