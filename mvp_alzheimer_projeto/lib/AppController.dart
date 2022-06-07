
import 'package:flutter/material.dart';


class AppController extends ChangeNotifier{
  static AppController instance = AppController();
  List<Widget> memories = <Widget>[];
  DateTime now = DateTime.now().toUtc();
  int counter = 0;
  Color mainColor = Color.fromRGBO(121,188,218, 1) ;





  void addMemory() {
      memories.add(
        Text("")
      );
      counter++;
      notifyListeners();
  }



}