import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/MemoryModel.dart';

import '../../AppController.dart';
class AddMemoryController{

  void excludeById(int identifier){
    MemoryModel.instance.memories.removeAt(identifier);

    int memCount = 0;
    MemoryModel.instance.memories.forEach((element) {
      element.setIdentifier(memCount);
      memCount++;
    });
  }
}