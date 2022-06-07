
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:image_picker/image_picker.dart';

class AppController extends ChangeNotifier{
  static AppController instance = AppController();
  List<Widget> memories = <Widget>[];
  
  DateTime now = DateTime.now().toUtc();
  int counter = 0;
  

  void addMemory() {
      memories.add(
        Text("")
      );
      counter++;
      notifyListeners();
  }

}