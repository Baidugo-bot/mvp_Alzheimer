
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projeto_estudo/src/models/ProfileModel.dart';

class AppController extends ChangeNotifier{
  static AppController instance = AppController();
  List<Widget> memories = <Widget>[];
  DateTime now = DateTime.now().toUtc();
  int counter = 0;
  Profile profile =  Profile(nome: "Nestor",dataNasc: DateTime.now(), image:AssetImage("assets/images/pelezin.jpg"));



  void addMemory() {
      memories.add(
        Text("")
      );
      counter++;
      notifyListeners();
  }

}